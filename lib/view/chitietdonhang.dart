import 'package:flutter/material.dart';
class ChiTietDonHang extends StatefulWidget {
  const ChiTietDonHang({super.key});

  @override
  State<StatefulWidget> createState() => _ChiTietDonHang();
}

class _ChiTietDonHang extends State<ChiTietDonHang> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: 412,
        height: 844,
        decoration: const BoxDecoration(
          color: Color(0xfffcffec),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              width: 412,
              top: 0,
              height: 153,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 412,
                    top: 0,
                    height: 153,
                    child: Container(
                      width: 390,
                      height: 153,
                      decoration: const BoxDecoration(
                        color: Color(0xff04cf86),
                        boxShadow: [BoxShadow(color: Color(0x3f02b273), offset: Offset(0, 4), blurRadius: 4),],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(75),
                          bottomLeft:  Radius.circular(75),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 125,
                    width: 153,
                    top: 65,
                    height: 30,
                    child: Text(
                      'Mã đơn B012',
                      textAlign: TextAlign.left,
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xffffffff), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 15,
                    width: 30,
                    top: 65,
                    height: 30,
                    child: Image.asset('assets/page-1/images/imageArrowBackRounded_126174.png', width: 30, height: 30,),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 355,
              width: 20,
              top: 69,
              height: 22,
              child: Image.asset('assets/page-1/images/imageVector_166441.png', width: 20, height: 22,),
            ),
            Positioned(
              left: 25,
              width: 360,
              top: 179,
              height: 380,
              child: Container(
                width: 360,
                height: 380,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  border: Border.all(color: const Color(0xff02b273), width: 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: const Color(0x3f02b273), offset: Offset(0, 4), blurRadius: 4),],
                ),
              ),
            ),
            Positioned(
              left: 42,
              width: 320,
              top: 197,
              height: 75,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 0,
                    height: 75,
                    child: Container(
                      width: 320,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0x00d9d9d9),
                        border: Border.all(color: const Color(0xff02b273), width: 1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 131,
                    top: 5,
                    height: 61,
                    child: Container(
                      width: 131,
                      height: 61,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            width: 61,
                            top: 0,
                            height: 61,
                            child: Image.asset('images/imageRectangle_166448.png', width: 61, height: 61, fit: BoxFit.cover,),
                          ),
                          const Positioned(
                            left: 74,
                            width: 57,
                            top: 6,
                            height: 36,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 20,
                                  child: Text(
                                    'Size: M',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color(0xff02b273), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    'Bạc xỉu',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              width: 320,
              top: 197,
              height: 75,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 0,
                    height: 75,
                    child: Container(
                      width: 320,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0x00d9d9d9),
                        border: Border.all(color: const Color(0xff02b273), width: 1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 5,
                    height: 61,
                    child: Container(
                      width: 320,
                      height: 61,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            width: 61,
                            top: 0,
                            height: 61,
                            child: Image.asset('images/imageRectangle_166461.png', width: 61, height: 61, fit: BoxFit.cover,),
                          ),
                          const Positioned(
                            left: 74,
                            width: 246,
                            top: 6,
                            height: 55,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 20,
                                  child: Text(
                                    'Size: M',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color(0xff02b273), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    'Bạc xỉu',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 230,
                                  top: 0,
                                  child: Text(
                                    'x1',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff04cf86), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 186,
                                  top: 37,
                                  child: Text(
                                    '30.000đ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff04cf86), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              width: 322,
              top: 272,
              height: 75,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 0,
                    height: 75,
                    child: Container(
                      width: 320,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0x00d9d9d9),
                        border: Border.all(color: const Color(0xff02b273), width: 1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 322,
                    top: 5,
                    height: 61,
                    child: Container(
                      width: 322,
                      height: 61,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            width: 61,
                            top: 0,
                            height: 61,
                            child: Image.asset('images/imageRectangle_166468.png', width: 61, height: 61, fit: BoxFit.cover,),
                          ),
                          const Positioned(
                            left: 74,
                            width: 248,
                            top: 6,
                            height: 55,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 20,
                                  child: Text(
                                    'Size: L',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color(0xff02b273), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    'Bạc xỉu',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 230,
                                  top: 0,
                                  child: Text(
                                    'x2',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff04cf86), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Positioned(
                                  left: 186,
                                  top: 37,
                                  child: Text(
                                    '60.000đ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff04cf86), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                    maxLines: 9999,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              width: 320,
              top: 375,
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 0,
                    height: 30,
                    child: Container(
                      width: 320,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(color: const Color(0xff288463), width: 1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 308,
                    top: 5,
                    height: 25,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          width: 25,
                          top: 0,
                          height: 25,
                          child: Image.asset('images/imgLocation_166476.png', width: 25, height: 25,),
                        ),
                        const Positioned(
                          left: 25,
                          top: 4,
                          child: Text(
                            '828 Đ. Sư Vạn Hạnh, Phường 12, Q.10, tp.HCM',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              width: 320,
              top: 408,
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 0,
                    height: 30,
                    child: Container(
                      width: 320,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(color: const Color(0xff288463), width: 1),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    width: 147,
                    top: 5,
                    height: 25,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 5,
                          child: Text(
                            'Người nhận: Trần Văn A',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              width: 320,
              top: 441,
              height: 30,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 320,
                    top: 0,
                    height: 30,
                    child: Container(
                      width: 320,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(color: const Color(0xff288463), width: 1),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    width: 300,
                    top: 5,
                    height: 25,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 5,
                          child: Text(
                            'Hình thức thanh toán: Thanh toán khi nhận hàng',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 13, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 233,
              top: 507,
              child: Text(
                'Tổng: 90.000đ',
                textAlign: TextAlign.left,
                style: TextStyle(decoration: TextDecoration.none, fontSize: 17, color: Color(0xff04cf86), fontFamily: 'Inter-SemiBold', fontWeight: FontWeight.normal),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
