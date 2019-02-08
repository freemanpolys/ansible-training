ssh-copy-id kokou028666@10.137.18.49
ansible all -m ping -i my_inventory
ansible coe-tools -m ping -i my_inventory
ansible test  -m file -a "path=/tmp/sonatel.txt state=touch" -i my_inventory
ansible all -i my_inventory -m command -a "ls  /tmp"
