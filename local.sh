


mkdocs build --clean
rm -f doc/index.html
cp -f index.html doc/
rm -rf doc/test
cp -a test_v2 doc/test


