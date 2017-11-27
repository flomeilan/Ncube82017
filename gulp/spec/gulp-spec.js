var shell = require('shelljs')

shell.config.silent = true

describe('gulp local', function () {
    it('gulp with no args should return some usage info', function () {
        var p = shell.exec('gulp')
        expect(p.code).toBe(0)
        expect(p.stdout.toString()).toContain('Usage')
    })
    it('gulp with unrecognized task name should fail', function () {
        var p = shell.exec('gulp unrecognizedtask')
        expect(p.code).not.toBe(0)
    })
})
