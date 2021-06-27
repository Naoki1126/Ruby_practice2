var = <<"EOF"
aaaaaa
bbbbbb
cccccc
EOF
puts var

<<"EOD"
aaaaaa
aaaaa
bbbbb
EOD


def foo
    <<-"EOS"
        aaaaa
        bbbbbb
        ccccccc
    EOS
end

p foo