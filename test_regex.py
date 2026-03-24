import unittest
from regex import matches_regex


class TestRegex(unittest.TestCase):

    # ACCEPTED

    def test_accept_1(self):
        self.assertTrue(matches_regex("beneficial"))

    def test_accept_2(self):
        self.assertTrue(matches_regex("benefactor"))

    def test_accept_3(self):
        self.assertTrue(matches_regex("bene"))

    def test_accept_4(self):
        self.assertTrue(matches_regex("descend"))

    def test_accept_5(self):
        self.assertTrue(matches_regex("transcend"))


    # REJECTED

    def test_reject_1(self):
        self.assertFalse(matches_regex("hello"))

    def test_reject_2(self):
        self.assertFalse(matches_regex("apple"))

    def test_reject_3(self):
        self.assertFalse(matches_regex("ben"))

    def test_reject_4(self):
        self.assertFalse(matches_regex("ascent"))

    def test_reject_5(self):
        self.assertFalse(matches_regex("science"))


if __name__ == "__main__":
    unittest.main()