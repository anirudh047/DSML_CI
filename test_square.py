import pytest
from square import get_square

def test_get_square():
    a=4
    result = get_square(a)

    assert result==16, f"Square of {a} is not {result}. It should be 16"