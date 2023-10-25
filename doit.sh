# Deps for Macbook to run
# brew install cairo boost-python3 redis rrdtool

# Get the path for rrdtool and update the below so tox can compile native binaries.
# brew info rrdtool
# export CFLAGS="-I/opt/homebrew/Cellar/rrdtool/1.8.0/include"
# export LDFLAGS="-L/opt/homebrew/Cellar/rrdtool/1.8.0/lib"

docker compose up -d

python -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip 'setuptools<58' --force-reinstall
pip install 'tox<4' tox-gh-actions flake8 pytest
pip install -r requirements.txt

export TEST_REDIS_HOST=localhost
export TEST_REDIS_PORT=6379
export TEST_MYSQL_HOST=localhost
export TEST_MYSQL_PORT=3306
export TEST_MYSQL_PASSWORD=graphite
export TEST_POSTGRES_HOST=localhost
export TEST_POSTGRES_PORT=5432
export TEST_POSTGRESQL_PASSWORD=graphite

# Run Tests
#tox