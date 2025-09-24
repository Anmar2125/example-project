from app import suma, resta

def test_suma_positivos():
    assert suma(2, 3) == 5

def test_suma_negativos():
    assert suma(-1, -1) == -2

def test_resta_positivos():
    assert resta(5, 2) == 3

def test_resta_negativos():
    assert resta(-3, -2) == -1