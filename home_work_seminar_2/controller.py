from Operation import Operation as op
from home_work_seminar_2.View import View


class Controller():

    view:View

    def __init__(self):
        view = View()

    def get_command_and_data_from_view(self, kind_of: int, id: int, field1: str, field2: str,field3: str,field4: str,field5: str):


        if (kind_of == op.UPDATE):
            sql_queue = ""

