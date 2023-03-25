from tkinter import *
from tkinter import ttk
from Conection import DataBase
from datetime import date

ventana=Tk()
ventana.title("Consultas de Ubicaciones")
ventana.geometry("600x500")

marco = LabelFrame(ventana, text="Formulario consultas de ubicaciones")
marco.place(x=50,y=50,width=500,height=400)

db=DataBase()
value=StringVar()

lblValue=Label(marco,text="FIltro").grid(column=0,row=0, padx=5,pady=5)
txtValue=Entry(marco,textvariable=value)
txtValue.grid(column=1,row=0)

lblMensaje=Label(marco, text="Mensaje validación", fg="green")
lblMensaje.grid(column=0, row=2, columnspan=4)

btnConsultar=Button(marco, text="Consultar", command=lambda:LlenarTabla())
btnConsultar.grid(column=2, row=4)

btnGuardarr=Button(marco, text="Guardar Consulta", command=lambda:InsertConsulta())
btnGuardarr.grid(column=3, row=4)

TxtResponse=Label(marco, text="Respuesta del servidor", fg="green").grid(column=0, row=2, columnspan=4)
tvResponse=ttk.Treeview(marco)

tvResponse.grid(column=0, row=3, columnspan=7,padx=5)
tvResponse["columns"]=("Mensaje")
tvResponse.column("#0", width=0,stretch=NO)
tvResponse.column("Mensaje", width=600,anchor=NW)
tvResponse.heading("#0", text="")
tvResponse.heading("Mensaje", text="Mensaje", anchor=CENTER)

lblMensaje=Label(marco, text="", fg="green")
lblMensaje.grid(column=0, row=6, columnspan=4)

def LlenarTabla():
    limpiardatos()
    var =value.get()
    sql="select *from cadena where llave ="+ var
    db.cursor.execute(sql)
    filas=db.cursor.fetchall()

    for fila in filas:
        Mensaje=fila[0]
        tvResponse.insert("", END, Mensaje, text=Mensaje, values=fila)


def limpiardatos():
    filas= tvResponse.get_children()
    for fila in filas:
        tvResponse.delete(fila) 


def InsertConsulta():
    val=(str(value.get())[:3],str(value.get())[3:6],str(value.get())[-3:],date.today())
    sql="insert into consultas (CodPais, CodZona, CodDistrito, FechaRegistro) values (%s,%s,%s,%s)"
    db.cursor.execute(sql,val)
    db.connection.commit()
    lblMensaje.config(text="Se ha guardado la consulta", fg="green")
    limpiardatos()

ventana.mainloop()
