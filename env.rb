LIB_DIR = File.join(ROOT_DIR, 'lib')
MODELS_DIR = File.join(ROOT_DIR, 'models')
EXT_DIR = File.join(ROOT_DIR, 'ext')
DATA_DIR = File.join(LIB_DIR, 'data')
HELPERS_DIR = File.join(LIB_DIR, 'helpers')
ACCESS_DIR = File.join(MODELS_DIR, 'access')
$LOAD_PATH.unshift(LIB_DIR, DATA_DIR, MODELS_DIR, HELPERS_DIR, EXT_DIR, ACCESS_DIR)

require 'date'
require 'base64'

require 'yaml'
require 'data_helper'
require 'oracle_helper'
require 'access_helper'

require 'sequel'
require 'sequel/extensions/inflector'
require 'factory_bot'

require 'sequel_factory_bot_extension'

require 'watir'
ENV['NLS_LANG'] = 'AMERICAN_AMERICA.WE8ISO8859P15'

include(DataHelper, OracleHelper, AccessHelper)

connect_to_access_for_persistence
connect_to_oracle

require 'results'