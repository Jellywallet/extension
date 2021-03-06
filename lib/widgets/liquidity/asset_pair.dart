import 'package:defi_wallet/helpers/tokens_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetPair extends StatefulWidget {
  final String pair;
  final double? size;
  final bool isRotate;
  final bool? isTransform;

  const AssetPair(
      {Key? key,
      required this.pair,
      this.size = 30,
      this.isRotate = false,
      this.isTransform = true})
      : super(key: key);

  @override
  State<AssetPair> createState() => _AssetPairState();
}

class _AssetPairState extends State<AssetPair> {
  TokensHelper tokenHelper = TokensHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isRotate ? 40 : widget.size,
      width: (widget.isTransform!) ? widget.size! * 2 : widget.size! * 2 + 5,
      child: Stack(
        children: [
          !widget.isRotate
              ? Positioned(
                  height: 6,
                  bottom: 0,
                  left: 0,
                  child: widget.isTransform!
                      ? Transform(
                          transform: Matrix4.skewX(-0.8),
                          child: Container(
                            width: widget.size! * 2 - 5,
                            height: 6,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topLeft,
                                colors: <Color>[
                                  Color(0xFF45A3FB),
                                  Color(0xFF6FB6F7)
                                ],
                                tileMode: TileMode.repeated,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: widget.size! * 2,
                          height: 6,
                          child:
                              SvgPicture.asset('assets/rotate_rectangle.svg'),
                        ),
                )
              : Container(),
          Container(
            width: (widget.isTransform!) ? widget.size! * 2 : widget.size! * 2 + 5,
            height: widget.isRotate ? 40 : widget.size,
            padding: !widget.isTransform! ?  const EdgeInsets.only(left: 5) : null,
            child: Stack(
              children: [
                Positioned(
                  left: widget.size! - 10,
                  top: widget.isRotate ? 10 : 0,
                  child: SvgPicture.asset(
                    tokenHelper
                        .getImageNameByTokenName(widget.pair.split('-')[1]),
                    height: widget.size,
                    width: widget.size,
                  ),
                ),
                Positioned(
                  child: SvgPicture.asset(
                    tokenHelper
                        .getImageNameByTokenName(widget.pair.split('-')[0]),
                    height: widget.size,
                    width: widget.size,
                  ),
                ),
                !widget.isRotate
                    ? Positioned(
                        bottom: 0,
                        child: Container(
                          width: widget.size! * 2 - 12,
                          height: 3,
                          color: Color(0xFF45A3FB),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
