#!/bin/bash

# wait for the volume to be attached
while [ ! -e ${device_name} ]; do sleep 1; done

# create a filesystem and mount the volume
mkfs.ext4 ${device_name}
mkdir -p /mnt/ebs_volume
mount ${device_name} /mnt/ebs_volume

# write some data to the volume
echo "Hello, World!" > /mnt/ebs_volume/hello.txt

# Add additional files or content
echo "This is a test file." > /mnt/ebs_volume/testfile.txt
wget -O /mnt/ebs_volume/samplefile.txt http://example.com/samplefile.txt

# You can also use cloud-init for more complex setups
cat <<EOF > /mnt/ebs_volume/cloud-config.txt
#cloud-config
write_files:
  - path: /mnt/ebs_volume/config.txt
    content: |
      This is a configuration file.
EOF

