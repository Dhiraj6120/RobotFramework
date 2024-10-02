import random
import string

from robot.libraries.BuiltIn import BuiltIn


class CustomKeywords:
    user_prefix = "user_"
    email_extension = "@yopmail.com"
    lastname = ""
    firstname = ""
    user_email = ""
    password = ""

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    def tap_on_register_button(self):
        self.selLib.wait_until_element_is_visible("class:ico-register")
        self.selLib.click_element("class:ico-register")

    def fill_the_login_form_with_wrong_creds(self):
        self.selLib.wait_until_element_is_visible("id:gender-male")
        self.selLib.click_element("id:gender-male")
        # self.selLib.input_text("id:FirstName", "Tanuja")
        self.selLib.input_text("id:LastName", "lastname")
        self.selLib.input_text("id:Email", "fn12asa322@gmail.com")
        self.selLib.input_password("id:Password", "flnasdaame@45")
        self.selLib.input_password("id:ConfirmPassword", "flnasdaame@45")
        self.selLib.click_element("xpath://*[@value=\"Register\"]")

    def fill_the_registration_form_with_valid_creds_using_customKeywords(self):
        self.generate_random_user()
        self.selLib.wait_until_element_is_visible("id:gender-male")
        self.selLib.click_element("id:gender-male")
        self.selLib.input_text("id:FirstName", self.firstname)
        self.selLib.input_text("id:LastName", self.lastname)
        self.selLib.input_text("id:Email", self.user_email)
        self.selLib.input_password("id:Password", self.password)
        self.selLib.input_password("id:ConfirmPassword", self.password)
        self.selLib.click_element("xpath://*[@value=\"Register\"]")

    def generate_random_user(self):
        self.lastname = self.user_prefix + ''.join(random.choices(string.ascii_letters + string.digits, k=5))
        self.firstname = self.user_prefix + ''.join(random.choices(string.ascii_letters + string.digits, k=5))
        self.user_email = self.lastname + self.firstname + self.email_extension
        self.password = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
