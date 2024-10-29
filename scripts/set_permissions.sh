# Change ownership to skogix:skogix

cd $SKOGAI_HOME

chown -R skogix:skogix /home/skogix/dev/

# Set file permissions to 644, except for executables
find /home/skogix/dev/ -type f ! -name "*.sh" -exec chmod 644 {} \;

# Set executable permissions for shell scripts
find /home/skogix/dev/ -type f -name "*.sh" -exec chmod +x {} \;

# Set directory permissions to 755
find /home/skogix/dev/ -type d -exec chmod 755 {} \;
