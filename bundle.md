## Create `dotFiles.zip`

Run the following command from the project root directory.

```bash
zip -r dotFiles.zip ./.* -x .gitignore -x '.git/*' -x '*.DS_Store'
```
