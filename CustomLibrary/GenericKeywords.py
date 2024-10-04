from robot.libraries.BuiltIn import BuiltIn


class GenericKeywords:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    def click(self, web_element):
        self.selLib.wait_until_element_is_visible(web_element)
        self.selLib.click_element(web_element)

    """ use clickAsOptional method to tap on optional popups or screen"""
    def clickAsOptional(self, web_element: str, optional: bool):
        self.selLib.wait_until_element_is_visible(web_element)
        if web_element is not None:
            self.selLib.click_element(web_element)
        else:
            if not optional:
                self.selLib.log("Failed to Tap on element")
