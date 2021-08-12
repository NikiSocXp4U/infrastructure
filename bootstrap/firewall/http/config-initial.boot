system {
    host-name vyos
    login {
        user vyos {
            authentication {
                encrypted-password '$6$QxPS.uk6mfo$9QBSo8u1FkH16gMyAVhus6fU3LOzvLR9Z9.82m3tiHFAxTtIkhaZSWssSgzt4v4dGAL8rhVQxTg0oAG9/q11h/'
                plaintext-password ''
            }
            level admin
        }
    }
    syslog {
        global {
            facility all {
                level notice
            }
            facility protocols {
                level debug
            }
        }
    }
    ntp {
        server '0.vyos.pool.ntp.org'
        server '1.vyos.pool.ntp.org'
        server '2.vyos.pool.ntp.org'
    }
    console {
        device ttyS0 {
            speed 115200
        }
    }
    config-management {
        commit-revisions 100
    }
}
service {
    ssh {
    }
}
interfaces {
    loopback lo {
    }
}
