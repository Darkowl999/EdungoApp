import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// For changing the language
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
// import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart


void main() => runApp(MaterialApp(
  title: "Registro de Usuario",
  home: MyHomePage4(),
  theme: ThemeData.light().copyWith(
      inputDecorationTheme:
      InputDecorationTheme(border: OutlineInputBorder())),
  localizationsDelegates: [
    // ... app-specific localization delegate[s] here
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('en'), // English
    const Locale('es'), // Spanish
    const Locale('fr'), // French
    const Locale('zh'), // Chinese
  ],
));

class MyHomePage4 extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage4> {
  final _formKey=GlobalKey<FormState>();
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registro de Usuario"),
          backgroundColor: Colors.green,
        ),
        body: Form(
            key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            SizedBox(height: 40,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "NOMBRES"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'El nombre es un campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "APELLIDOS"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Los apellidos son una campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "NOMBRE DE USUARIO"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'el nombre de usuario es un campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "TÉLEFONO"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'El télefono es un campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "CORREO ELÉCTRONICO"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'el correo eléctronico es un campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Por favor ingrese datos';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "CONTRASEÑA"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Contraseña es un campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 80,
              child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "CONFIRMAR CONTRASEÑA"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Confirmar contraseña es un campo requerido';
                    }
                    return null;
                  }
              ),
            ),
            Material(
              elevation: 1,
              child: Text(
                "SELECCIONE SU FECHA DE NACIMIENTO",style:TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            // padding: const EdgeInsets.symmetric(vertical: 10.0),child:
            DateTimeForm(),//TODO  ESTA  ES UNA CLASE QUE ESA POR ABAJO
            SizedBox(height: 10,),
            SizedBox(height: 10,),
          Material(
            elevation: 1,
            child: Text(
                "SELECCIONE SU GENERO",style:TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold,fontStyle:FontStyle.italic),),
          ),
            SizedBox(height: 10,),
          LabeledCheckbox(
            label: 'Masculino',
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            value: _isSelected,
            onChanged: (bool newValue) {
              setState(() {
                _isSelected = newValue;
              });
            },
          ),
            SizedBox(height: 10,),
            SizedBox(height: 10,),
            LabeledCheckbox(
              label: "Femenino",
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _isSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _isSelected = newValue;
                });
              },
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: 80,
              height: 80,
              child: GFButton(
                color: Colors.deepPurple,
                onPressed: (){
                  //devolverá true si el formulario es válido, o falso si el formulario no es valido
                  if(_formKey.currentState.validate()){
                    //si el formulario es valido , se mostrará un snackbar
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("Procesando datos"),));

                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //este navigator es para la ruta//
                        builder: (context) =>null
                    ),
                  );
                },
                child: Text("REGISTRARME",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,fontSize: 20,color: Colors.white),),
              ),
            ),
            SizedBox(height: 40,),
            Material(),
            SizedBox(height: 50,),

          ],
        )),
    );
  }
}

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          basicDate(context)
      /*    RaisedButton(
            child: Text('Save'),
            onPressed: () => formKey.currentState.save(),
          ),
          RaisedButton(
            child: Text('Reset'),
            onPressed: () => formKey.currentState.reset(),
          ),
          RaisedButton(
            child: Text('Validate'),
            onPressed: () => formKey.currentState.validate(),
          ),**/
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic dates field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}

class IosStylePickers extends StatefulWidget {
  @override
  _IosStylePickersState createState() => _IosStylePickersState();
}

class _IosStylePickersState extends State<IosStylePickers> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  DateTime value;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('iOS style pickers (${format.pattern})'),
      DateTimeField(
        initialValue: value,
        format: format,
        onShowPicker: (context, currentValue) async {
          await showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoDatePicker(
                  onDateTimeChanged: (DateTime date) {
                    value = date;
                  },
                );
              });
          setState(() {});
          return value;
        },
      ),
    ]);
  }
}

class ComplexDateTimeField extends StatefulWidget {
  @override
  _ComplexDateTimeFieldState createState() => _ComplexDateTimeFieldState();
}

class _ComplexDateTimeFieldState extends State<ComplexDateTimeField> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final initialValue = DateTime.now();

  bool autoValidate = false;
  bool readOnly = true;
  bool showResetIcon = true;
  DateTime value = DateTime.now();
  int changedCount = 0;
  int savedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Complex date & time field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
        autovalidate: autoValidate,
        validator: (date) => date == null ? 'Invalid date' : null,
        initialValue: initialValue,
        onChanged: (date) => setState(() {
          value = date;
          changedCount++;
        }),
        onSaved: (date) => setState(() {
          value = date;
          savedCount++;
        }),
        resetIcon: showResetIcon ? Icon(Icons.delete) : null,
        readOnly: readOnly,
        decoration: InputDecoration(
            helperText: 'Changed: $changedCount, Saved: $savedCount, $value'),
      ),
      CheckboxListTile(
        title: Text('autoValidate'),
        value: autoValidate,
        onChanged: (value) => setState(() => autoValidate = value),
      ),
      CheckboxListTile(
        title: Text('readOnly'),
        value: readOnly,
        onChanged: (value) => setState(() => readOnly = value),
      ),
      CheckboxListTile(
        title: Text('showResetIcon'),
        value: showResetIcon,
        onChanged: (value) => setState(() => showResetIcon = value),
      ),
    ]);
  }
}

class Clock24Example extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('24 hour clock'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child),
          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}

class LocaleExample extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Changing the pickers\' language'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: DateTime.now(),
            lastDate: DateTime(2100),
            builder: (context, child) => Localizations.override(
              context: context,
              locale: Locale('zh'),
              child: child,
            ),
          );
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
              TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              builder: (context, child) => Localizations.override(
                context: context,
                locale: Locale('zh'),
                child: child,
              ),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ]);
  }
}
//======================================= CLASE DONDE SE ENCUENTRA EL FORMULARIO ============================================

class pruebanga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyCustomForm(),
    );

  }
}

//clase formulario personalizado//

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  //esto es un global key form state//
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:ListView(
        children: [
          SizedBox(height: 40,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "NOMBRES"),
                validator: (value){
                  if(value.isEmpty){
                    return 'El nombre es un campo requerido';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "APELLIDOS"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Los apellidos son una campo requerido';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "NOMBRE DE USUARIO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'el nombre de usuario es un campo requerido';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "TÉLEFONO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'El télefono es un campo requerido';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CORREO ELÉCTRONICO"),
                validator: (value){
                  if(value.isEmpty){
                    return 'el correo eléctronico es un campo requerido';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Por favor ingrese datos';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "CONFIRMAR CONTRASEÑA"),
                validator: (value){
                  if(value.isEmpty){
                    return 'Confirmar su contraseña es un campo requerido';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            width: 80,
            child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
                validator: (value){
                  if(value.isEmpty){
                    return 'La direccion es un campo obligatorio';
                  }
                  return null;
                }
            ),
          ),
          SizedBox(height: 10,),

          SizedBox(
            height: 50,
            child:GFButton(
              color: Colors.black54,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //este navigator es para la ruta//
                      builder: (context) =>BasicTimeField()
                  ),
                );
              },
              text: "INSERTAR FECHA DE NACIMIENTO",
              shape: GFButtonShape.square,
              type: GFButtonType.outline,
            ),
          ),
          SizedBox(height: 10,),
          // padding: const EdgeInsets.symmetric(vertical: 10.0),child:
          SizedBox(
            width: 80,
            height: 80,
            child: GFButton(
              color: Colors.deepPurple,
              onPressed: (){
                //devolverá true si el formulario es válido, o falso si el formulario no es valido
                if(_formKey.currentState.validate()){
                  //si el formulario es valido , se mostrará un snackbar
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Procesando datos"),));

                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //este navigator es para la ruta//
                    builder: (context) =>null
                  ),
                );
              },
              child: Text("REGISTRARME",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,fontSize: 20,color: Colors.white),),
            ),
          ),
          SizedBox(height: 40,),
          Material(),

        ],
      ),
    );
  }
}

//TODO: ESTA CLASE ES LA DE LOS LABELS QUE SELLECIONAN TU GENERO O SEXO
class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}




//===============================================================WIDGETS APARTE COMO TAL ===============================================


Widget formulario(BuildContext context){
  final _formKey=GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child:ListView(
      children: [
        SizedBox(height: 40,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "NOMBRES"),
              validator: (value){
                if(value.isEmpty){
                  return 'El nombre es un campo requerido';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "APELLIDOS"),
              validator: (value){
                if(value.isEmpty){
                  return 'Los apellidos son una campo requerido';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "NOMBRE DE USUARIO"),
              validator: (value){
                if(value.isEmpty){
                  return 'el nombre de usuario es un campo requerido';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "TÉLEFONO"),
              validator: (value){
                if(value.isEmpty){
                  return 'El télefono es un campo requerido';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "CORREO ELÉCTRONICO"),
              validator: (value){
                if(value.isEmpty){
                  return 'el correo eléctronico es un campo requerido';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
              validator: (value){
                if(value.isEmpty){
                  return 'Por favor ingrese datos';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "CONFIRMAR CONTRASEÑA"),
              validator: (value){
                if(value.isEmpty){
                  return 'Confirmar su contraseña es un campo requerido';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 100,
          width: 80,
          child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "DIRECCIÓN"),
              validator: (value){
                if(value.isEmpty){
                  return 'La direccion es un campo obligatorio';
                }
                return null;
              }
          ),
        ),
        SizedBox(height: 10,),

        SizedBox(
          height: 50,
          child:GFButton(
            color: Colors.black54,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  //este navigator es para la ruta//
                    builder: (context) =>BasicTimeField()
                ),
              );


            },
            text: "INSERTAR FECHA DE NACIMIENTO",
            shape: GFButtonShape.square,
            type: GFButtonType.outline,
          ),
        ),
        SizedBox(height: 10,),
        // padding: const EdgeInsets.symmetric(vertical: 10.0),child:
        SizedBox(
          width: 80,
          height: 80,
          child: GFButton(
            color: Colors.deepPurple,
            onPressed: (){
              //devolverá true si el formulario es válido, o falso si el formulario no es valido
              if(_formKey.currentState.validate()){
                //si el formulario es valido , se mostrará un snackbar
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Procesando datos"),));

              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  //este navigator es para la ruta//
                    builder: (context) =>null
                ),
              );
            },
            child: Text("REGISTRARME",style: TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,fontSize: 20,color: Colors.white),),
          ),
        ),
        SizedBox(height: 40,),
        Material(),

      ],
    ),
  );

}

Widget basicDate(BuildContext context){
  final format = DateFormat("yyyy-MM-dd");
  return Container(
    child: Column(children: <Widget>[
      Text('Año/Mes/Día  (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]),
  );
}//TODO: ESTE WIEDGET ESTA ES EL QUE UTILIZO PARA LAS FECHAS