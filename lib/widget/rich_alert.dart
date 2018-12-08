import 'dart:ui'; 
import 'package:flutter/material.dart'; 

class RichAlertDialog extends StatelessWidget {
  /// Indicates an error dialog by providing an error icon.
  static const int ERROR = 0; 

  /// Indicates a success dialog by providing a success icon.
  static const int SUCCESS = 1; 

  /// Indicates a warning dialog by providing a warning icon.
  static const int WARNING = 2; 

  Map < int, AssetImage > typeAsset =  {
    ERROR:AssetImage("assets/error.png"), 
    SUCCESS:AssetImage("assets/success.png"), 
    WARNING:AssetImage("assets/warning.png"), 
  }; 

  final BuildContext context; 

  /// The title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Usually has a bigger fontSize than the [alertSubtitle].
  final Text alertTitle; 

  /// The subtitle of the dialog is displayed in a medium-sized font beneath
  /// the title of the dialog.
  ///
  /// Usually has a smaller fontSize than the [alertTitle]
  final Text alertSubtitle; 

  /// The type of dialog, whether warning, success or error.
  final int alertType; 

  /// The (optional) actions to be performed in the dialog is displayed
  /// the subtitle of the dialog. If no values are provided, a default
  /// [Button] widget is rendered.
  ///
  /// Typically a [List<Widget>] widget.
  final List < Widget > actions; 

  /// Specifies how blur the screen overlay effect should be.
  /// Higher values mean more blurred overlays.
  final double blurValue; 
  final double backgroundOpacity; 

  /// (Optional) User defined icon for the dialog. Advisable to use the
  /// default icon matching the dialog type.
  Icon dialogIcon; 

  double deviceWidth; 
  double deviceHeight; 
  double dialogHeight; 

  RichAlertDialog( {
    @required this.context, 
    @required this.alertTitle, 
    @required this.alertSubtitle, 
    @required this.alertType, 
    this.actions, 
    this.blurValue, 
    this.backgroundOpacity, 
    this.dialogIcon, 
  }); 

  @override
  Widget build(BuildContext context) {
    context = this.context; 
    Size screenSize = MediaQuery.of(context).size; 
    deviceWidth = screenSize.width; 
    deviceHeight = screenSize.height; 
    dialogHeight = deviceHeight * (2 / 5); 

    return BackdropFilter(
      filter:ImageFilter.blur(
        sigmaX:this.blurValue != null?blurValue:3.0, 
        sigmaY:this.blurValue != null?blurValue:3.0, 
      ), 
      child:Container(
        height:deviceHeight, 
        color:Colors.white.withOpacity(
            this.backgroundOpacity != null?backgroundOpacity:0.2), 
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.center, 
          mainAxisSize:MainAxisSize.max, 
          mainAxisAlignment:MainAxisAlignment.end, 
          children: < Widget > [
            Expanded(
              child:Stack(
                alignment:Alignment.topCenter, 
                children: < Widget > [
                  Positioned(
                    bottom:0.0, 
                    child:Container(
                      height:dialogHeight, 
                      width:deviceWidth * 0.9, 
                      child:Card(
                        shape:RoundedRectangleBorder(
                          borderRadius:BorderRadius.only(
                              topLeft:Radius.circular(20.0), 
                              topRight:Radius.circular(20.0)), 
                        ), 
                        color:Colors.white, 
                        child:Column(
                          crossAxisAlignment:CrossAxisAlignment.center, 
                          children: < Widget > [
                            SizedBox(height:dialogHeight / 4), 
                            alertTitle, 
                            SizedBox(height:dialogHeight / 10), 
                            alertSubtitle, 
                            SizedBox(height:dialogHeight / 10), 
                            this.actions != null && this.actions.isNotEmpty?buildActions():defaultAction(context), 
                          ], 
                        ), 
                      ), 
                    ), 
                  ), 
                  Positioned(
                    bottom:dialogHeight - 50, 
                    child:this.dialogIcon != null?this.dialogIcon:defaultIcon(), 
                  ), 
                ], 
              ), 
            ), 
          ], 
        ), 
      ), 
    ); 
  }

  Container buildActions() {
    return Container(
      child:Row(
        mainAxisSize:MainAxisSize.min, 
        children:this.actions, 
      ), 
    ); 
  }

  Image defaultIcon() {
    return Image(
      image:typeAsset[this.alertType], 
      width:deviceHeight / 7, 
      height:deviceHeight / 7, 
      // size: deviceHeight / 7,
    ); 
  }

  static Text title(String title) {
    return Text(
      title, 
      style:TextStyle(fontSize:24.0), 
    ); 
  }

  static Text subtitle(String subtitle) {
    return Text(
      subtitle, 
      style:TextStyle(
        color:Colors.grey, 
      ), 
    ); 
  }

  Container defaultAction(BuildContext context) {
    return Container(
      alignment:Alignment.center, 
      child:RaisedButton(
        elevation:2.0, 
        color:Colors.green, 
        child:Text(
          "GOT IT", 
          style:TextStyle(color:Colors.white), 
        ), 
        onPressed:() {
          Navigator.pop(context); 
        }, 
      ), 
    ); 
  }
}
