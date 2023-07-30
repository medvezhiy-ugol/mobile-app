import 'package:flutter/material.dart';

class Ingredient extends StatefulWidget {
  const Ingredient({super.key, required this.text});

  final String text;

  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  bool isline = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        isline = !isline;
        setState(() {

        });
      },
      child: Container(
        height: 36,
        color: Color(0xff26282f),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isline
              ? Container(
            height: 36,
            color: Color(0xff26282f),
            child: Text(widget.text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                  color: Color(0xffffffff)
              ),
            ),
          )
              : Row(
            children: [
              SizedBox(
                child: Icon(
                  Icons.close,
                  color: Color(0xffffffff),
                  size: 16,
                ),
              ),
              SizedBox(
                width: 9.33,
              ),
              Text(widget.text,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xffffffff)
                ),
              ),
            ],
          ),
                )
      )
    );
  }
}
