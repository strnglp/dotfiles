function mount_cube
  sudo umount /Users/jviolano/Sync
  sudo sshfs -o allow_other,default_permissions jv@cube:/home/jv/Sync/ ~/Sync/
end
