#!/usr/bin/env python3

from earth import Animal

class Human(Animal):
    """Class representing a Human."""

    def __init__(self, name=None):
        super().__init__(True)
        self._name = name

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        if not isinstance(name, str):
            raise ValueError('must be str')
        self._name = name

hooman = Human('@sonph')
print(hooman.name)
