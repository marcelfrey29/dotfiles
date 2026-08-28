echo "Copying Zed Config..."

rsync \
    -avh \
    --exclude "install.sh" \
    ./ ~/.config/zed/

echo "Copied Zed Config."
