/**
 * @license almond 0.3.3 Copyright jQuery Foundation and other contributors.
 * Released under MIT license, http://github.com/requirejs/almond/LICENSE
 */
//Going sloppy to avoid 'use strict' string cost, but strict practices should
//be followed.
/*global setTimeout: false */
var requirejs, require, define;
(function (undef) {
    var main, req, makeMap, handlers, defined = {}, waiting = {}, config = {}, defining = {}, hasOwn = Object.prototype.hasOwnProperty, aps = [].slice, jsSuffixRegExp = /\.js$/;
    function hasProp(obj, prop) {
        return hasOwn.call(obj, prop);
    }
    /**
     * Given a relative module name, like ./something, normalize it to
     * a real name that can be mapped to a path.
     * @param {String} name the relative name
     * @param {String} baseName a real name that the name arg is relative
     * to.
     * @returns {String} normalized name
     */
    function normalize(name, baseName) {
        var nameParts, nameSegment, mapValue, foundMap, lastIndex, foundI, foundStarMap, starI, i, j, part, normalizedBaseParts, baseParts = baseName && baseName.split('/'), map = config.map, starMap = map && map['*'] || {};
        //Adjust any relative paths.
        if (name) {
            name = name.split('/');
            lastIndex = name.length - 1;
            // If wanting node ID compatibility, strip .js from end
            // of IDs. Have to do this here, and not in nameToUrl
            // because node allows either .js or non .js to map
            // to same file.
            if (config.nodeIdCompat && jsSuffixRegExp.test(name[lastIndex])) {
                name[lastIndex] = name[lastIndex].replace(jsSuffixRegExp, '');
            }
            // Starts with a '.' so need the baseName
            if (name[0].charAt(0) === '.' && baseParts) {
                //Convert baseName to array, and lop off the last part,
                //so that . matches that 'directory' and not name of the baseName's
                //module. For instance, baseName of 'one/two/three', maps to
                //'one/two/three.js', but we want the directory, 'one/two' for
                //this normalization.
                normalizedBaseParts = baseParts.slice(0, baseParts.length - 1);
                name = normalizedBaseParts.concat(name);
            }
            //start trimDots
            for (i = 0; i < name.length; i++) {
                part = name[i];
                if (part === '.') {
                    name.splice(i, 1);
                    i -= 1;
                } else if (part === '..') {
                    // If at the start, or previous value is still ..,
                    // keep them so that when converted to a path it may
                    // still work when converted to a path, even though
                    // as an ID it is less than ideal. In larger point
                    // releases, may be better to just kick out an error.
                    if (i === 0 || i === 1 && name[2] === '..' || name[i - 1] === '..') {
                        continue;
                    } else if (i > 0) {
                        name.splice(i - 1, 2);
                        i -= 2;
                    }
                }
            }
            //end trimDots
            name = name.join('/');
        }
        //Apply map config if available.
        if ((baseParts || starMap) && map) {
            nameParts = name.split('/');
            for (i = nameParts.length; i > 0; i -= 1) {
                nameSegment = nameParts.slice(0, i).join('/');
                if (baseParts) {
                    //Find the longest baseName segment match in the config.
                    //So, do joins on the biggest to smallest lengths of baseParts.
                    for (j = baseParts.length; j > 0; j -= 1) {
                        mapValue = map[baseParts.slice(0, j).join('/')];
                        //baseName segment has  config, find if it has one for
                        //this name.
                        if (mapValue) {
                            mapValue = mapValue[nameSegment];
                            if (mapValue) {
                                //Match, update name to the new value.
                                foundMap = mapValue;
                                foundI = i;
                                break;
                            }
                        }
                    }
                }
                if (foundMap) {
                    break;
                }
                //Check for a star map match, but just hold on to it,
                //if there is a shorter segment match later in a matching
                //config, then favor over this star map.
                if (!foundStarMap && starMap && starMap[nameSegment]) {
                    foundStarMap = starMap[nameSegment];
                    starI = i;
                }
            }
            if (!foundMap && foundStarMap) {
                foundMap = foundStarMap;
                foundI = starI;
            }
            if (foundMap) {
                nameParts.splice(0, foundI, foundMap);
                name = nameParts.join('/');
            }
        }
        return name;
    }
    function makeRequire(relName, forceSync) {
        return function () {
            //A version of a require function that passes a moduleName
            //value for items that may need to
            //look up paths relative to the moduleName
            var args = aps.call(arguments, 0);
            //If first arg is not require('string'), and there is only
            //one arg, it is the array form without a callback. Insert
            //a null so that the following concat is correct.
            if (typeof args[0] !== 'string' && args.length === 1) {
                args.push(null);
            }
            return req.apply(undef, args.concat([
                relName,
                forceSync
            ]));
        };
    }
    function makeNormalize(relName) {
        return function (name) {
            return normalize(name, relName);
        };
    }
    function makeLoad(depName) {
        return function (value) {
            defined[depName] = value;
        };
    }
    function callDep(name) {
        if (hasProp(waiting, name)) {
            var args = waiting[name];
            delete waiting[name];
            defining[name] = true;
            main.apply(undef, args);
        }
        if (!hasProp(defined, name) && !hasProp(defining, name)) {
            throw new Error('No ' + name);
        }
        return defined[name];
    }
    //Turns a plugin!resource to [plugin, resource]
    //with the plugin being undefined if the name
    //did not have a plugin prefix.
    function splitPrefix(name) {
        var prefix, index = name ? name.indexOf('!') : -1;
        if (index > -1) {
            prefix = name.substring(0, index);
            name = name.substring(index + 1, name.length);
        }
        return [
            prefix,
            name
        ];
    }
    //Creates a parts array for a relName where first part is plugin ID,
    //second part is resource ID. Assumes relName has already been normalized.
    function makeRelParts(relName) {
        return relName ? splitPrefix(relName) : [];
    }
    /**
     * Makes a name map, normalizing the name, and using a plugin
     * for normalization if necessary. Grabs a ref to plugin
     * too, as an optimization.
     */
    makeMap = function (name, relParts) {
        var plugin, parts = splitPrefix(name), prefix = parts[0], relResourceName = relParts[1];
        name = parts[1];
        if (prefix) {
            prefix = normalize(prefix, relResourceName);
            plugin = callDep(prefix);
        }
        //Normalize according
        if (prefix) {
            if (plugin && plugin.normalize) {
                name = plugin.normalize(name, makeNormalize(relResourceName));
            } else {
                name = normalize(name, relResourceName);
            }
        } else {
            name = normalize(name, relResourceName);
            parts = splitPrefix(name);
            prefix = parts[0];
            name = parts[1];
            if (prefix) {
                plugin = callDep(prefix);
            }
        }
        //Using ridiculous property names for space reasons
        return {
            f: prefix ? prefix + '!' + name : name,
            //fullName
            n: name,
            pr: prefix,
            p: plugin
        };
    };
    function makeConfig(name) {
        return function () {
            return config && config.config && config.config[name] || {};
        };
    }
    handlers = {
        require: function (name) {
            return makeRequire(name);
        },
        exports: function (name) {
            var e = defined[name];
            if (typeof e !== 'undefined') {
                return e;
            } else {
                return defined[name] = {};
            }
        },
        module: function (name) {
            return {
                id: name,
                uri: '',
                exports: defined[name],
                config: makeConfig(name)
            };
        }
    };
    main = function (name, deps, callback, relName) {
        var cjsModule, depName, ret, map, i, relParts, args = [], callbackType = typeof callback, usingExports;
        //Use name if no relName
        relName = relName || name;
        relParts = makeRelParts(relName);
        //Call the callback to define the module, if necessary.
        if (callbackType === 'undefined' || callbackType === 'function') {
            //Pull out the defined dependencies and pass the ordered
            //values to the callback.
            //Default to [require, exports, module] if no deps
            deps = !deps.length && callback.length ? [
                'require',
                'exports',
                'module'
            ] : deps;
            for (i = 0; i < deps.length; i += 1) {
                map = makeMap(deps[i], relParts);
                depName = map.f;
                //Fast path CommonJS standard dependencies.
                if (depName === 'require') {
                    args[i] = handlers.require(name);
                } else if (depName === 'exports') {
                    //CommonJS module spec 1.1
                    args[i] = handlers.exports(name);
                    usingExports = true;
                } else if (depName === 'module') {
                    //CommonJS module spec 1.1
                    cjsModule = args[i] = handlers.module(name);
                } else if (hasProp(defined, depName) || hasProp(waiting, depName) || hasProp(defining, depName)) {
                    args[i] = callDep(depName);
                } else if (map.p) {
                    map.p.load(map.n, makeRequire(relName, true), makeLoad(depName), {});
                    args[i] = defined[depName];
                } else {
                    throw new Error(name + ' missing ' + depName);
                }
            }
            ret = callback ? callback.apply(defined[name], args) : undefined;
            if (name) {
                //If setting exports via "module" is in play,
                //favor that over return value and exports. After that,
                //favor a non-undefined return value over exports use.
                if (cjsModule && cjsModule.exports !== undef && cjsModule.exports !== defined[name]) {
                    defined[name] = cjsModule.exports;
                } else if (ret !== undef || !usingExports) {
                    //Use the return value from the function.
                    defined[name] = ret;
                }
            }
        } else if (name) {
            //May just be an object definition for the module. Only
            //worry about defining if have a module name.
            defined[name] = callback;
        }
    };
    requirejs = require = req = function (deps, callback, relName, forceSync, alt) {
        if (typeof deps === 'string') {
            if (handlers[deps]) {
                //callback in this case is really relName
                return handlers[deps](callback);
            }
            //Just return the module wanted. In this scenario, the
            //deps arg is the module name, and second arg (if passed)
            //is just the relName.
            //Normalize module name, if it contains . or ..
            return callDep(makeMap(deps, makeRelParts(callback)).f);
        } else if (!deps.splice) {
            //deps is a config object, not an array.
            config = deps;
            if (config.deps) {
                req(config.deps, config.callback);
            }
            if (!callback) {
                return;
            }
            if (callback.splice) {
                //callback is an array, which means it is a dependency list.
                //Adjust args if there are dependencies
                deps = callback;
                callback = relName;
                relName = null;
            } else {
                deps = undef;
            }
        }
        //Support require(['a'])
        callback = callback || function () {
        };
        //If relName is a function, it is an errback handler,
        //so remove it.
        if (typeof relName === 'function') {
            relName = forceSync;
            forceSync = alt;
        }
        //Simulate async callback;
        if (forceSync) {
            main(undef, deps, callback, relName);
        } else {
            //Using a non-zero value because of concern for what old browsers
            //do, and latest browsers "upgrade" to 4 if lower value is used:
            //http://www.whatwg.org/specs/web-apps/current-work/multipage/timers.html#dom-windowtimers-settimeout:
            //If want a value immediately, use require('id') instead -- something
            //that works in almond on the global level, but not guaranteed and
            //unlikely to work in other AMD implementations.
            setTimeout(function () {
                main(undef, deps, callback, relName);
            }, 4);
        }
        return req;
    };
    /**
     * Just drops the config on the floor, but returns req in case
     * the config return value is used.
     */
    req.config = function (cfg) {
        return req(cfg);
    };
    /**
     * Expose module registry for debugging and tooling
     */
    requirejs._defined = defined;
    define = function (name, deps, callback) {
        if (typeof name !== 'string') {
            throw new Error('See almond README: incorrect module build, no module name');
        }
        //This module may not have dependencies
        if (!deps.splice) {
            //deps is not an array, so probably means
            //an object literal or factory function for
            //the value. Adjust args.
            callback = deps;
            deps = [];
        }
        if (!hasProp(defined, name) && !hasProp(waiting, name)) {
            waiting[name] = [
                name,
                deps,
                callback
            ];
        }
    };
    define.amd = { jQuery: true };
}());
define('almond', [], function () {
    return;
});
/* global define: false */
/* global require: false */
/* global requirejs: false */
(function loadTemplateSafe() {
    'use strict';
    define('SC.LoadTemplateSafe', [], function () {
        return {
            load: function (name, req, onload, config) {
                try {
                    req([name], function (value) {
                        onload(value);
                    });
                } catch (e) {
                }
            }
        };
    });
    function copyProperties(source, dest) {
        for (var property in source) {
            if (source.hasOwnProperty(property)) {
                dest[property] = source[property];
            }
        }
    }
    function insertPlugin(deps) {
        if (deps.splice) {
            for (var i = 0; i < deps.length; i++) {
                if (deps[i].indexOf('.tpl') !== -1 && deps[i].indexOf('SC.LoadTemplateSafe!') === -1) {
                    deps[i] = 'SC.LoadTemplateSafe!' + deps[i];
                }
            }
        }
    }
    function wrapFunction(func, param_index) {
        var original = func;
        func = function () {
            insertPlugin(arguments[param_index]);
            return original.apply(null, arguments);
        };
        copyProperties(original, func);
        return func;
    }
    // define = function (name, deps, callback)
    define = wrapFunction(define, 1);
    // require = function (deps, callback, relName, forceSync, alt)
    requirejs = require = wrapFunction(require, 0);
}());
define('LoadTemplateSafe', [], function () {
    return;
});
/**!

 @license
 handlebars v4.0.11

Copyright (C) 2011-2017 by Yehuda Katz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/
!function (a, b) {
    'object' == typeof exports && 'object' == typeof module ? module.exports = b() : 'function' == typeof define && define.amd ? define('Handlebars', [], b) : 'object' == typeof exports ? exports.Handlebars = b() : a.Handlebars = b();
}(this, function () {
    return function (a) {
        function b(d) {
            if (c[d])
                return c[d].exports;
            var e = c[d] = {
                exports: {},
                id: d,
                loaded: !1
            };
            return a[d].call(e.exports, e, e.exports, b), e.loaded = !0, e.exports;
        }
        var c = {};
        return b.m = a, b.c = c, b.p = '', b(0);
    }([
        function (a, b, c) {
            'use strict';
            function d() {
                var a = new h.HandlebarsEnvironment();
                return n.extend(a, h), a.SafeString = j['default'], a.Exception = l['default'], a.Utils = n, a.escapeExpression = n.escapeExpression, a.VM = p, a.template = function (b) {
                    return p.template(b, a);
                }, a;
            }
            var e = c(1)['default'], f = c(2)['default'];
            b.__esModule = !0;
            var g = c(3), h = e(g), i = c(20), j = f(i), k = c(5), l = f(k), m = c(4), n = e(m), o = c(21), p = e(o), q = c(33), r = f(q), s = d();
            s.create = d, r['default'](s), s['default'] = s, b['default'] = s, a.exports = b['default'];
        },
        function (a, b) {
            'use strict';
            b['default'] = function (a) {
                if (a && a.__esModule)
                    return a;
                var b = {};
                if (null != a)
                    for (var c in a)
                        Object.prototype.hasOwnProperty.call(a, c) && (b[c] = a[c]);
                return b['default'] = a, b;
            }, b.__esModule = !0;
        },
        function (a, b) {
            'use strict';
            b['default'] = function (a) {
                return a && a.__esModule ? a : { 'default': a };
            }, b.__esModule = !0;
        },
        function (a, b, c) {
            'use strict';
            function d(a, b, c) {
                this.helpers = a || {}, this.partials = b || {}, this.decorators = c || {}, i.registerDefaultHelpers(this), j.registerDefaultDecorators(this);
            }
            var e = c(2)['default'];
            b.__esModule = !0, b.HandlebarsEnvironment = d;
            var f = c(4), g = c(5), h = e(g), i = c(9), j = c(17), k = c(19), l = e(k), m = '4.0.11';
            b.VERSION = m;
            var n = 7;
            b.COMPILER_REVISION = n;
            var o = {
                1: '<= 1.0.rc.2',
                2: '== 1.0.0-rc.3',
                3: '== 1.0.0-rc.4',
                4: '== 1.x.x',
                5: '== 2.0.0-alpha.x',
                6: '>= 2.0.0-beta.1',
                7: '>= 4.0.0'
            };
            b.REVISION_CHANGES = o;
            var p = '[object Object]';
            d.prototype = {
                constructor: d,
                logger: l['default'],
                log: l['default'].log,
                registerHelper: function (a, b) {
                    if (f.toString.call(a) === p) {
                        if (b)
                            throw new h['default']('Arg not supported with multiple helpers');
                        f.extend(this.helpers, a);
                    } else
                        this.helpers[a] = b;
                },
                unregisterHelper: function (a) {
                    delete this.helpers[a];
                },
                registerPartial: function (a, b) {
                    if (f.toString.call(a) === p)
                        f.extend(this.partials, a);
                    else {
                        if ('undefined' == typeof b)
                            throw new h['default']('Attempting to register a partial called "' + a + '" as undefined');
                        this.partials[a] = b;
                    }
                },
                unregisterPartial: function (a) {
                    delete this.partials[a];
                },
                registerDecorator: function (a, b) {
                    if (f.toString.call(a) === p) {
                        if (b)
                            throw new h['default']('Arg not supported with multiple decorators');
                        f.extend(this.decorators, a);
                    } else
                        this.decorators[a] = b;
                },
                unregisterDecorator: function (a) {
                    delete this.decorators[a];
                }
            };
            var q = l['default'].log;
            b.log = q, b.createFrame = f.createFrame, b.logger = l['default'];
        },
        function (a, b) {
            'use strict';
            function c(a) {
                return k[a];
            }
            function d(a) {
                for (var b = 1; b < arguments.length; b++)
                    for (var c in arguments[b])
                        Object.prototype.hasOwnProperty.call(arguments[b], c) && (a[c] = arguments[b][c]);
                return a;
            }
            function e(a, b) {
                for (var c = 0, d = a.length; c < d; c++)
                    if (a[c] === b)
                        return c;
                return -1;
            }
            function f(a) {
                if ('string' != typeof a) {
                    if (a && a.toHTML)
                        return a.toHTML();
                    if (null == a)
                        return '';
                    if (!a)
                        return a + '';
                    a = '' + a;
                }
                return m.test(a) ? a.replace(l, c) : a;
            }
            function g(a) {
                return !a && 0 !== a || !(!p(a) || 0 !== a.length);
            }
            function h(a) {
                var b = d({}, a);
                return b._parent = a, b;
            }
            function i(a, b) {
                return a.path = b, a;
            }
            function j(a, b) {
                return (a ? a + '.' : '') + b;
            }
            b.__esModule = !0, b.extend = d, b.indexOf = e, b.escapeExpression = f, b.isEmpty = g, b.createFrame = h, b.blockParams = i, b.appendContextPath = j;
            var k = {
                    '&': '&amp;',
                    '<': '&lt;',
                    '>': '&gt;',
                    '"': '&quot;',
                    '\'': '&#x27;',
                    '`': '&#x60;',
                    '=': '&#x3D;'
                }, l = /[&<>"'`=]/g, m = /[&<>"'`=]/, n = Object.prototype.toString;
            b.toString = n;
            var o = function (a) {
                return 'function' == typeof a;
            };
            o(/x/) && (b.isFunction = o = function (a) {
                return 'function' == typeof a && '[object Function]' === n.call(a);
            }), b.isFunction = o;
            var p = Array.isArray || function (a) {
                return !(!a || 'object' != typeof a) && '[object Array]' === n.call(a);
            };
            b.isArray = p;
        },
        function (a, b, c) {
            'use strict';
            function d(a, b) {
                var c = b && b.loc, g = void 0, h = void 0;
                c && (g = c.start.line, h = c.start.column, a += ' - ' + g + ':' + h);
                for (var i = Error.prototype.constructor.call(this, a), j = 0; j < f.length; j++)
                    this[f[j]] = i[f[j]];
                Error.captureStackTrace && Error.captureStackTrace(this, d);
                try {
                    c && (this.lineNumber = g, e ? Object.defineProperty(this, 'column', {
                        value: h,
                        enumerable: !0
                    }) : this.column = h);
                } catch (k) {
                }
            }
            var e = c(6)['default'];
            b.__esModule = !0;
            var f = [
                'description',
                'fileName',
                'lineNumber',
                'message',
                'name',
                'number',
                'stack'
            ];
            d.prototype = new Error(), b['default'] = d, a.exports = b['default'];
        },
        function (a, b, c) {
            a.exports = {
                'default': c(7),
                __esModule: !0
            };
        },
        function (a, b, c) {
            var d = c(8);
            a.exports = function (a, b, c) {
                return d.setDesc(a, b, c);
            };
        },
        function (a, b) {
            var c = Object;
            a.exports = {
                create: c.create,
                getProto: c.getPrototypeOf,
                isEnum: {}.propertyIsEnumerable,
                getDesc: c.getOwnPropertyDescriptor,
                setDesc: c.defineProperty,
                setDescs: c.defineProperties,
                getKeys: c.keys,
                getNames: c.getOwnPropertyNames,
                getSymbols: c.getOwnPropertySymbols,
                each: [].forEach
            };
        },
        function (a, b, c) {
            'use strict';
            function d(a) {
                g['default'](a), i['default'](a), k['default'](a), m['default'](a), o['default'](a), q['default'](a), s['default'](a);
            }
            var e = c(2)['default'];
            b.__esModule = !0, b.registerDefaultHelpers = d;
            var f = c(10), g = e(f), h = c(11), i = e(h), j = c(12), k = e(j), l = c(13), m = e(l), n = c(14), o = e(n), p = c(15), q = e(p), r = c(16), s = e(r);
        },
        function (a, b, c) {
            'use strict';
            b.__esModule = !0;
            var d = c(4);
            b['default'] = function (a) {
                a.registerHelper('blockHelperMissing', function (b, c) {
                    var e = c.inverse, f = c.fn;
                    if (b === !0)
                        return f(this);
                    if (b === !1 || null == b)
                        return e(this);
                    if (d.isArray(b))
                        return b.length > 0 ? (c.ids && (c.ids = [c.name]), a.helpers.each(b, c)) : e(this);
                    if (c.data && c.ids) {
                        var g = d.createFrame(c.data);
                        g.contextPath = d.appendContextPath(c.data.contextPath, c.name), c = { data: g };
                    }
                    return f(b, c);
                });
            }, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            var d = c(2)['default'];
            b.__esModule = !0;
            var e = c(4), f = c(5), g = d(f);
            b['default'] = function (a) {
                a.registerHelper('each', function (a, b) {
                    function c(b, c, f) {
                        j && (j.key = b, j.index = c, j.first = 0 === c, j.last = !!f, k && (j.contextPath = k + b)), i += d(a[b], {
                            data: j,
                            blockParams: e.blockParams([
                                a[b],
                                b
                            ], [
                                k + b,
                                null
                            ])
                        });
                    }
                    if (!b)
                        throw new g['default']('Must pass iterator to #each');
                    var d = b.fn, f = b.inverse, h = 0, i = '', j = void 0, k = void 0;
                    if (b.data && b.ids && (k = e.appendContextPath(b.data.contextPath, b.ids[0]) + '.'), e.isFunction(a) && (a = a.call(this)), b.data && (j = e.createFrame(b.data)), a && 'object' == typeof a)
                        if (e.isArray(a))
                            for (var l = a.length; h < l; h++)
                                h in a && c(h, h, h === a.length - 1);
                        else {
                            var m = void 0;
                            for (var n in a)
                                a.hasOwnProperty(n) && (void 0 !== m && c(m, h - 1), m = n, h++);
                            void 0 !== m && c(m, h - 1, !0);
                        }
                    return 0 === h && (i = f(this)), i;
                });
            }, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            var d = c(2)['default'];
            b.__esModule = !0;
            var e = c(5), f = d(e);
            b['default'] = function (a) {
                a.registerHelper('helperMissing', function () {
                    if (1 !== arguments.length)
                        throw new f['default']('Missing helper: "' + arguments[arguments.length - 1].name + '"');
                });
            }, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            b.__esModule = !0;
            var d = c(4);
            b['default'] = function (a) {
                a.registerHelper('if', function (a, b) {
                    return d.isFunction(a) && (a = a.call(this)), !b.hash.includeZero && !a || d.isEmpty(a) ? b.inverse(this) : b.fn(this);
                }), a.registerHelper('unless', function (b, c) {
                    return a.helpers['if'].call(this, b, {
                        fn: c.inverse,
                        inverse: c.fn,
                        hash: c.hash
                    });
                });
            }, a.exports = b['default'];
        },
        function (a, b) {
            'use strict';
            b.__esModule = !0, b['default'] = function (a) {
                a.registerHelper('log', function () {
                    for (var b = [void 0], c = arguments[arguments.length - 1], d = 0; d < arguments.length - 1; d++)
                        b.push(arguments[d]);
                    var e = 1;
                    null != c.hash.level ? e = c.hash.level : c.data && null != c.data.level && (e = c.data.level), b[0] = e, a.log.apply(a, b);
                });
            }, a.exports = b['default'];
        },
        function (a, b) {
            'use strict';
            b.__esModule = !0, b['default'] = function (a) {
                a.registerHelper('lookup', function (a, b) {
                    return a && a[b];
                });
            }, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            b.__esModule = !0;
            var d = c(4);
            b['default'] = function (a) {
                a.registerHelper('with', function (a, b) {
                    d.isFunction(a) && (a = a.call(this));
                    var c = b.fn;
                    if (d.isEmpty(a))
                        return b.inverse(this);
                    var e = b.data;
                    return b.data && b.ids && (e = d.createFrame(b.data), e.contextPath = d.appendContextPath(b.data.contextPath, b.ids[0])), c(a, {
                        data: e,
                        blockParams: d.blockParams([a], [e && e.contextPath])
                    });
                });
            }, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            function d(a) {
                g['default'](a);
            }
            var e = c(2)['default'];
            b.__esModule = !0, b.registerDefaultDecorators = d;
            var f = c(18), g = e(f);
        },
        function (a, b, c) {
            'use strict';
            b.__esModule = !0;
            var d = c(4);
            b['default'] = function (a) {
                a.registerDecorator('inline', function (a, b, c, e) {
                    var f = a;
                    return b.partials || (b.partials = {}, f = function (e, f) {
                        var g = c.partials;
                        c.partials = d.extend({}, g, b.partials);
                        var h = a(e, f);
                        return c.partials = g, h;
                    }), b.partials[e.args[0]] = e.fn, f;
                });
            }, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            b.__esModule = !0;
            var d = c(4), e = {
                    methodMap: [
                        'debug',
                        'info',
                        'warn',
                        'error'
                    ],
                    level: 'info',
                    lookupLevel: function (a) {
                        if ('string' == typeof a) {
                            var b = d.indexOf(e.methodMap, a.toLowerCase());
                            a = b >= 0 ? b : parseInt(a, 10);
                        }
                        return a;
                    },
                    log: function (a) {
                        if (a = e.lookupLevel(a), 'undefined' != typeof console && e.lookupLevel(e.level) <= a) {
                            var b = e.methodMap[a];
                            console[b] || (b = 'log');
                            for (var c = arguments.length, d = Array(c > 1 ? c - 1 : 0), f = 1; f < c; f++)
                                d[f - 1] = arguments[f];
                            console[b].apply(console, d);
                        }
                    }
                };
            b['default'] = e, a.exports = b['default'];
        },
        function (a, b) {
            'use strict';
            function c(a) {
                this.string = a;
            }
            b.__esModule = !0, c.prototype.toString = c.prototype.toHTML = function () {
                return '' + this.string;
            }, b['default'] = c, a.exports = b['default'];
        },
        function (a, b, c) {
            'use strict';
            function d(a) {
                var b = a && a[0] || 1, c = s.COMPILER_REVISION;
                if (b !== c) {
                    if (b < c) {
                        var d = s.REVISION_CHANGES[c], e = s.REVISION_CHANGES[b];
                        throw new r['default']('Template was precompiled with an older version of Handlebars than the current runtime. Please update your precompiler to a newer version (' + d + ') or downgrade your runtime to an older version (' + e + ').');
                    }
                    throw new r['default']('Template was precompiled with a newer version of Handlebars than the current runtime. Please update your runtime to a newer version (' + a[1] + ').');
                }
            }
            function e(a, b) {
                function c(c, d, e) {
                    e.hash && (d = p.extend({}, d, e.hash), e.ids && (e.ids[0] = !0)), c = b.VM.resolvePartial.call(this, c, d, e);
                    var f = b.VM.invokePartial.call(this, c, d, e);
                    if (null == f && b.compile && (e.partials[e.name] = b.compile(c, a.compilerOptions, b), f = e.partials[e.name](d, e)), null != f) {
                        if (e.indent) {
                            for (var g = f.split('\n'), h = 0, i = g.length; h < i && (g[h] || h + 1 !== i); h++)
                                g[h] = e.indent + g[h];
                            f = g.join('\n');
                        }
                        return f;
                    }
                    throw new r['default']('The partial ' + e.name + ' could not be compiled when running in runtime-only mode');
                }
                function d(b) {
                    function c(b) {
                        return '' + a.main(e, b, e.helpers, e.partials, g, i, h);
                    }
                    var f = arguments.length <= 1 || void 0 === arguments[1] ? {} : arguments[1], g = f.data;
                    d._setup(f), !f.partial && a.useData && (g = j(b, g));
                    var h = void 0, i = a.useBlockParams ? [] : void 0;
                    return a.useDepths && (h = f.depths ? b != f.depths[0] ? [b].concat(f.depths) : f.depths : [b]), (c = k(a.main, c, e, f.depths || [], g, i))(b, f);
                }
                if (!b)
                    throw new r['default']('No environment passed to template');
                if (!a || !a.main)
                    throw new r['default']('Unknown template object: ' + typeof a);
                a.main.decorator = a.main_d, b.VM.checkRevision(a.compiler);
                var e = {
                    strict: function (a, b) {
                        if (!(b in a))
                            throw new r['default']('"' + b + '" not defined in ' + a);
                        return a[b];
                    },
                    lookup: function (a, b) {
                        for (var c = a.length, d = 0; d < c; d++)
                            if (a[d] && null != a[d][b])
                                return a[d][b];
                    },
                    lambda: function (a, b) {
                        return 'function' == typeof a ? a.call(b) : a;
                    },
                    escapeExpression: p.escapeExpression,
                    invokePartial: c,
                    fn: function (b) {
                        var c = a[b];
                        return c.decorator = a[b + '_d'], c;
                    },
                    programs: [],
                    program: function (a, b, c, d, e) {
                        var g = this.programs[a], h = this.fn(a);
                        return b || e || d || c ? g = f(this, a, h, b, c, d, e) : g || (g = this.programs[a] = f(this, a, h)), g;
                    },
                    data: function (a, b) {
                        for (; a && b--;)
                            a = a._parent;
                        return a;
                    },
                    merge: function (a, b) {
                        var c = a || b;
                        return a && b && a !== b && (c = p.extend({}, b, a)), c;
                    },
                    nullContext: l({}),
                    noop: b.VM.noop,
                    compilerInfo: a.compiler
                };
                return d.isTop = !0, d._setup = function (c) {
                    c.partial ? (e.helpers = c.helpers, e.partials = c.partials, e.decorators = c.decorators) : (e.helpers = e.merge(c.helpers, b.helpers), a.usePartial && (e.partials = e.merge(c.partials, b.partials)), (a.usePartial || a.useDecorators) && (e.decorators = e.merge(c.decorators, b.decorators)));
                }, d._child = function (b, c, d, g) {
                    if (a.useBlockParams && !d)
                        throw new r['default']('must pass block params');
                    if (a.useDepths && !g)
                        throw new r['default']('must pass parent depths');
                    return f(e, b, a[b], c, 0, d, g);
                }, d;
            }
            function f(a, b, c, d, e, f, g) {
                function h(b) {
                    var e = arguments.length <= 1 || void 0 === arguments[1] ? {} : arguments[1], h = g;
                    return !g || b == g[0] || b === a.nullContext && null === g[0] || (h = [b].concat(g)), c(a, b, a.helpers, a.partials, e.data || d, f && [e.blockParams].concat(f), h);
                }
                return h = k(c, h, a, g, d, f), h.program = b, h.depth = g ? g.length : 0, h.blockParams = e || 0, h;
            }
            function g(a, b, c) {
                return a ? a.call || c.name || (c.name = a, a = c.partials[a]) : a = '@partial-block' === c.name ? c.data['partial-block'] : c.partials[c.name], a;
            }
            function h(a, b, c) {
                var d = c.data && c.data['partial-block'];
                c.partial = !0, c.ids && (c.data.contextPath = c.ids[0] || c.data.contextPath);
                var e = void 0;
                if (c.fn && c.fn !== i && !function () {
                        c.data = s.createFrame(c.data);
                        var a = c.fn;
                        e = c.data['partial-block'] = function (b) {
                            var c = arguments.length <= 1 || void 0 === arguments[1] ? {} : arguments[1];
                            return c.data = s.createFrame(c.data), c.data['partial-block'] = d, a(b, c);
                        }, a.partials && (c.partials = p.extend({}, c.partials, a.partials));
                    }(), void 0 === a && e && (a = e), void 0 === a)
                    throw new r['default']('The partial ' + c.name + ' could not be found');
                if (a instanceof Function)
                    return a(b, c);
            }
            function i() {
                return '';
            }
            function j(a, b) {
                return b && 'root' in b || (b = b ? s.createFrame(b) : {}, b.root = a), b;
            }
            function k(a, b, c, d, e, f) {
                if (a.decorator) {
                    var g = {};
                    b = a.decorator(b, g, c, d && d[0], e, f, d), p.extend(b, g);
                }
                return b;
            }
            var l = c(22)['default'], m = c(1)['default'], n = c(2)['default'];
            b.__esModule = !0, b.checkRevision = d, b.template = e, b.wrapProgram = f, b.resolvePartial = g, b.invokePartial = h, b.noop = i;
            var o = c(4), p = m(o), q = c(5), r = n(q), s = c(3);
        },
        function (a, b, c) {
            a.exports = {
                'default': c(23),
                __esModule: !0
            };
        },
        function (a, b, c) {
            c(24), a.exports = c(29).Object.seal;
        },
        function (a, b, c) {
            var d = c(25);
            c(26)('seal', function (a) {
                return function (b) {
                    return a && d(b) ? a(b) : b;
                };
            });
        },
        function (a, b) {
            a.exports = function (a) {
                return 'object' == typeof a ? null !== a : 'function' == typeof a;
            };
        },
        function (a, b, c) {
            var d = c(27), e = c(29), f = c(32);
            a.exports = function (a, b) {
                var c = (e.Object || {})[a] || Object[a], g = {};
                g[a] = b(c), d(d.S + d.F * f(function () {
                    c(1);
                }), 'Object', g);
            };
        },
        function (a, b, c) {
            var d = c(28), e = c(29), f = c(30), g = 'prototype', h = function (a, b, c) {
                    var i, j, k, l = a & h.F, m = a & h.G, n = a & h.S, o = a & h.P, p = a & h.B, q = a & h.W, r = m ? e : e[b] || (e[b] = {}), s = m ? d : n ? d[b] : (d[b] || {})[g];
                    m && (c = b);
                    for (i in c)
                        j = !l && s && i in s, j && i in r || (k = j ? s[i] : c[i], r[i] = m && 'function' != typeof s[i] ? c[i] : p && j ? f(k, d) : q && s[i] == k ? function (a) {
                            var b = function (b) {
                                return this instanceof a ? new a(b) : a(b);
                            };
                            return b[g] = a[g], b;
                        }(k) : o && 'function' == typeof k ? f(Function.call, k) : k, o && ((r[g] || (r[g] = {}))[i] = k));
                };
            h.F = 1, h.G = 2, h.S = 4, h.P = 8, h.B = 16, h.W = 32, a.exports = h;
        },
        function (a, b) {
            var c = a.exports = 'undefined' != typeof window && window.Math == Math ? window : 'undefined' != typeof self && self.Math == Math ? self : Function('return this')();
            'number' == typeof __g && (__g = c);
        },
        function (a, b) {
            var c = a.exports = { version: '1.2.6' };
            'number' == typeof __e && (__e = c);
        },
        function (a, b, c) {
            var d = c(31);
            a.exports = function (a, b, c) {
                if (d(a), void 0 === b)
                    return a;
                switch (c) {
                case 1:
                    return function (c) {
                        return a.call(b, c);
                    };
                case 2:
                    return function (c, d) {
                        return a.call(b, c, d);
                    };
                case 3:
                    return function (c, d, e) {
                        return a.call(b, c, d, e);
                    };
                }
                return function () {
                    return a.apply(b, arguments);
                };
            };
        },
        function (a, b) {
            a.exports = function (a) {
                if ('function' != typeof a)
                    throw TypeError(a + ' is not a function!');
                return a;
            };
        },
        function (a, b) {
            a.exports = function (a) {
                try {
                    return !!a();
                } catch (b) {
                    return !0;
                }
            };
        },
        function (a, b) {
            (function (c) {
                'use strict';
                b.__esModule = !0, b['default'] = function (a) {
                    var b = 'undefined' != typeof c ? c : window, d = b.Handlebars;
                    a.noConflict = function () {
                        return b.Handlebars === a && (b.Handlebars = d), a;
                    };
                }, a.exports = b['default'];
            }.call(b, function () {
                return this;
            }()));
        }
    ]);
});
// @module HandlebarsExtra 'Handlebars.CompilerNameLookup' exports a function helper used in the templates to see if an object is a backbone model and access it 
// using expressions like 'model.name'. See gulp/tasks/templates.js 'Handlebars.JavaScriptCompiler.prototype.nameLookup'. 
define('Handlebars.CompilerNameLookup', [], function () {
    'use strict';
    /* globals Backbone */
    // heads up ! for separate templates from the rest of .js it is optimal that this file don't require backbone with AMD but globally. 
    return function (parent, name) {
        if (parent instanceof Backbone.Model) {
            if (name === '__customFieldsMetadata') {
                return parent.__customFieldsMetadata;
            } else {
                return parent.get(name);
            }
        } else {
            return parent[name];
        }
    };
});
define('index-javascript-lib', [
    'almond',
    'LoadTemplateSafe',
    'Handlebars',
    'Handlebars.CompilerNameLookup'
], function (a1, a2, a3, a4) {
});