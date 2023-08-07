import dearpygui.dearpygui as dpg
from Controller import Controller
from Operation import Operation


class View:
    controller: Controller

    def __init__(self, controller: Controller):
        self.controller = controller
        self.vdg_id = ""
        self.vdg_first_name = ""
        self.vdg_last_name = ""
        self.vdg_age = ""
        self.vdg_departament = ""
        self.vdg_db_select = ""

    def on_create(self):
        ret_dict = {"user_id": dpg.get_value(self.vdg_id),
                    "first_name": dpg.get_value(self.vdg_first_name),
                    "last_name": dpg.get_value(self.vdg_last_name),
                    "age": dpg.get_value(self.vdg_age),
                    "departament": dpg.get_value(self.vdg_departament)
                    }
        self.controller.set_command_and_data_from_view(Operation.CREATE, ret_dict)

    def on_select(self):
        dpg.set_value(self.vdg_db_select
                      , self.controller.set_command_and_data_from_view(Operation.READ
                                                                       , {"none": "none"}))

    def on_update(self):
        ret_dict = {"user_id": dpg.get_value(self.vdg_id),
                    "first_name": dpg.get_value(self.vdg_first_name),
                    "last_name": dpg.get_value(self.vdg_last_name),
                    "age": dpg.get_value(self.vdg_age),
                    "departament": dpg.get_value(self.vdg_departament)
                    }
        self.controller.set_command_and_data_from_view(Operation.UPDATE, ret_dict)

    def on_delete(self):
        ret_dict = {"user_id": dpg.get_value(self.vdg_id)}
        self.controller.set_command_and_data_from_view(Operation.DELETE, ret_dict)

    def show_gui(self):
        dpg.create_context()

        with dpg.window(label="DB", width=550, height=390):

            self.vdg_id = dpg.add_input_text(label="user_id")
            self.vdg_first_name = dpg.add_input_text(label="first_name")
            self.vdg_last_name = dpg.add_input_text(label="last_name")
            self.vdg_age = dpg.add_input_text(label="age")
            self.vdg_departament = dpg.add_input_text(label="departament")

            dpg.add_button(label="Create"
                           , callback=self.on_create)
            dpg.add_button(label="Select *"
                           , callback=self.on_select)
            dpg.add_button(label="Update"
                           , callback=self.on_update)
            dpg.add_button(label="Delete"
                           , callback=self.on_delete)

            self.vdg_db_select = dpg.add_text()

        dpg.create_viewport(title="CRUD demo", width=600, height=400)

        dpg.setup_dearpygui()
        dpg.show_viewport()
        dpg.start_dearpygui()
        dpg.destroy_context()
