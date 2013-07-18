# !/bin/sh

echo "Build libpinyin.js"
emcc ../share/pinyinime.cpp ../share/dictbuilder.cpp ../share/dicttrie.cpp ../share/matrixsearch.cpp ../share/ngram.cpp ../share/searchutility.cpp ../share/spellingtrie.cpp ../share/sync.cpp ../share/utf16char.cpp ../share/dictlist.cpp ../share/lpicache.cpp ../share/mystdlib.cpp ../share/spellingtable.cpp ../share/splparser.cpp ../share/userdict.cpp ../share/utf16reader.cpp -O2 -g3 --closure 0 -o libpinyin.js -s LINKABLE=1 -s TOTAL_STACK=262144 -s TOTAL_MEMORY=16777216 -s EXPORTED_FUNCTIONS="['_im_open_decoder', '_im_open_decoder_fd', '_im_close_decoder', '_im_set_max_lens', '_im_flush_cache', '_im_search', '_im_delsearch', '_im_reset_search', '_im_get_sps_str', '_im_get_candidate', '_im_get_spl_start_pos', '_im_choose', '_im_cancel_last_choice', '_im_get_fixed_len', '_im_get_predicts', '_im_enable_shm_as_szm', '_im_enable_ym_as_szm']"

mkdir data

echo "cp dict file"
cp ../../res/raw/dict_pinyin.png data/dict.data

echo "Package dict data files"
python ~/work/opensource/emscripten/tools/file_packager.py empinyin_files.data --preload data/dict.data --preload --pre-run > empinyin_files.js

