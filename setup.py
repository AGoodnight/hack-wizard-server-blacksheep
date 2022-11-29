import os
from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.txt')).read()
CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()

requires = [
    'blacksheep',
    'uvicorn',
    'supervisor',
]

setup(
    name='microservice',
    version='0.0',
    description='blacksheep microservice',
    long_description=README + '\n\n' + CHANGES,
    author='Adam Goodnight',
    install_requires=requires,
    entry_points="""\
    [console_scripts]
        main = microservice:main
    """,
)