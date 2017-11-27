// const shell = require('shelljs')
// const request = require('request')
// const async = require('async')
// const nconf = require('nconf')
// const path = require('path')
// var esprima = require('esprima')

// describe('gulp local', () => {

//     nconf.file({ file: path.join(__dirname, '../../gulp/config/config.json') })

//     const devtoolsMode = nconf.get('extensionMode') ? 'extension' : 'theme'
//     const port = nconf.get('dbConfig:port')
//     const url = 'http://localhost:' + port + '/tmp/shopping-templates.js'
//     let gulpLocal

//     it('port must be unused', (done) => {
//         request(url, (error, response, body) => {
//             expect(error && error.code === 'ECONNREFUSED')
//             done()
//         })
//     })

//     it('wait until local ends loading', function (done) {
//         var interval = setInterval(() => {
//             request(url, (error, response, body) => {
//                 if (!error) {
//                     clearTimeout(interval)
//                     try {
//                         expect(esprima.parse(body.toString()) && 'valid javascript').toBe('valid javascript')
//                     }
//                     catch (ex) {
//                         expect(ex).not.toBeDefined()
//                     }
//                     done()
//                 }
//             })
//         }, 1000)

//         gulpLocal = shell.exec('gulp ' + devtoolsMode + ':local', (code) => {
//         })
//     })

//     it('kill the process', function(done)
//     {
//     	process.kill(gulpLocal.pid)
//     	done()
//     })

// })
