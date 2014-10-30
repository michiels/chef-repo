name 'docker'
description 'Docker containers on your server'
run_list "role[base]", "recipe[docker]"