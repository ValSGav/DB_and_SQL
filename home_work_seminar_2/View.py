import dearpygui.dearpygui as dpg


class View:

    def __init__(self):
        pass

    def on_create(self):
        pass

    def on_select(self):
        pass

    def on_update(self):
        pass

    def on_delete(self):
        pass


    def show_gui(self):
        dpg.create_context()

        with dpg.window(label="DB"):
            dpg.add_button(label="Create", callback=self.on_create)
            dpg.add_button(label="Select *", callback=self.on_select)
            dpg.add_button(label="Update", callback=self.on_update)
            dpg.add_button(label="Delete", callback=self.on_delete)

            dpg.add_text(
            ",sdfasdf asdfasdfads asdfasdfas\n   asdfasdfasdf    aasdfasdfasdfasd\n fasdf asdf asdfasdf asdf asdfasdf")

        dpg.create_viewport(title="CRUD demo", width=600, height=400)

        dpg.setup_dearpygui()
        dpg.show_viewport()
        dpg.start_dearpygui()
        dpg.destroy_context()
