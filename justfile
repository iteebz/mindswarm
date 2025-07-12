# justfile
# Common commands for the multi-language Mindswarm repository

# Build commands
build-python:
    @echo "Building Python package..."
    cd python && poetry build

build-js:
    @echo "Building JavaScript package..."
    cd js && npm install && npm run build

build-all: build-python build-js
    @echo "All packages built."

# Publish commands (requires proper authentication/configuration)
publish-python:
    @echo "Publishing Python package to PyPI..."
    cd python && poetry publish

publish-js:
    @echo "Publishing JavaScript package to NPM..."
    cd js && npm publish

publish-all: publish-python publish-js
    @echo "All packages published."

# Clean commands
clean-python:
    @echo "Cleaning Python build artifacts..."
    cd python && rm -rf dist build

clean-js:
    @echo "Cleaning JavaScript build artifacts..."
    cd js && rm -rf dist node_modules

clean-all: clean-python clean-js
    @echo "All build artifacts cleaned."

# Install dependencies
install-python:
    @echo "Installing Python dependencies..."
    cd python && poetry install

install-js:
    @echo "Installing JavaScript dependencies..."
    cd js && npm install

install-all: install-python install-js
    @echo "All dependencies installed."

commits:
    @git --no-pager log --pretty=format:"%ar %s"