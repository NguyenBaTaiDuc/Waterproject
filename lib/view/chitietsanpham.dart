import 'package:flutter/material.dart';
class ChiTietSanPham extends StatelessWidget {
  const ChiTietSanPham({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            width: 390,
            height: 844,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFFCFFEC)),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 390,
                    height: 155,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 390,
                            height: 155,
                            decoration: const ShapeDecoration(
                              color: Color(0xFF04CF86),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(70),
                                  bottomRight: Radius.circular(70),
                                ),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F02B273),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 26,
                          top: 26,
                          child: Container(
                            width: 337,
                            height: 17,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -1.14,
                                  top: 0,
                                  child: Container(
                                    width: 339.11,
                                    height: 17,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 336.20,
                                          top: 6.38,
                                          child: Container(
                                            width: 1.29,
                                            height: 4.25,
                                            child: const Stack(children: [

                                                ]),
                                          ),
                                        ),
                                        Positioned(
                                          left: 321.68,
                                          top: 6.73,
                                          child: Container(
                                            width: 17.43,
                                            height: 7.79,
                                            child: const Stack(children: [

                                                ]),
                                          ),
                                        ),
                                        Positioned(
                                          left: 300.08,
                                          top: 4.60,
                                          child: Container(
                                            width: 14.79,
                                            height: 11.65,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                    width: 14.79,
                                                    height: 11.65,
                                                    decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage("https://via.placeholder.com/15x12"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                    width: 14.79,
                                                    height: 11.65,
                                                    decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage("https://via.placeholder.com/15x12"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 278.75,
                                          top: 4.96,
                                          child: Container(
                                            width: 16.46,
                                            height: 11.33,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                    width: 16.46,
                                                    height: 11.33,
                                                    decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage("https://via.placeholder.com/16x11"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Container(
                                                    width: 16.46,
                                                    height: 11.33,
                                                    decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage("https://via.placeholder.com/16x11"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          top: 5.20,
                                          child: Container(
                                            width: 26.58,
                                            height: 11,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage("https://via.placeholder.com/27x11"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 79,
                          top: 65,
                          child: SizedBox(
                            width: 232,
                            height: 30,
                            child: Text(
                              'Thông tin sản phẩm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          top: 65,
                          child: Container(
                            width: 30,
                            height: 30,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Stack(children: [

                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 118,
                  top: 191,
                  child: Container(
                    width: 153,
                    height: 153,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/153x153"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        const BoxShadow(
                          color: Color(0x7F02B273),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 380,
                  child: Container(
                    width: 360,
                    height: 303,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 0,
                          top: 0,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tên: ',
                                  style: TextStyle(
                                    color: Color(0xFF288463),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Bạc xỉu',
                                  style: TextStyle(
                                    color: Color(0xFF288463),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 0,
                          top: 29,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Đơn giá:',
                                  style: TextStyle(
                                    color: Color(0xFF288463),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xFF04CF86),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                                TextSpan(
                                  text: '30.000đ',
                                  style: TextStyle(
                                    color: Color(0xFF288463),
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: 1.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 116,
                          child: Container(
                            width: 360,
                            height: 187,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 29,
                                  child: Container(
                                    width: 360,
                                    height: 158,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(width: 1, color: Color(0xFF02B273)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 13,
                                  top: 54,
                                  child: SizedBox(
                                    width: 333,
                                    height: 108,
                                    child: Text(
                                      'Bạc xỉu cà phê đá là thức uống rất quen thuộc với người Việt mỗi khi đến quán cà phê. Đồ uống này có rất nhiều cách pha chế với những hương vị khác nhau. Bạc xỉu đá đã góp thêm cho sự đa dạng, phong phú của danh mục cà phê truyền thống Việt.',
                                      style: TextStyle(
                                        color: Color(0xFF288463),
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    'Mô tả:',
                                    style: TextStyle(
                                      color: Color(0xFF288463),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 87,
                          child: Container(
                            width: 135,
                            height: 24,
                            child: Stack(
                              children: [
                                const Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    'Size:',
                                    style: TextStyle(
                                      color: Color(0xFF288463),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 53,
                                  top: 0,
                                  child: Container(
                                    width: 82,
                                    height: 24,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 35,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 2,
                                                  child: Container(
                                                    width: 19,
                                                    height: 19,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        side: const BorderSide(width: 1, color: Color(0xFF04CF86)),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Positioned(
                                                  left: 22,
                                                  top: 0,
                                                  child: Text(
                                                    'S',
                                                    style: TextStyle(
                                                      color: Color(0xFF288463),
                                                      fontSize: 20,
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 48,
                                          top: 0,
                                          child: Container(
                                            width: 34,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 2,
                                                  child: Container(
                                                    width: 19,
                                                    height: 19,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        side: const BorderSide(width: 1, color: Color(0xFF04CF86)),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Positioned(
                                                  left: 22,
                                                  top: 0,
                                                  child: Text(
                                                    'L',
                                                    style: TextStyle(
                                                      color: Color(0xFF288463),
                                                      fontSize: 20,
                                                      fontFamily: 'Inter',
                                                      fontWeight: FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 58,
                          child: Container(
                            width: 194,
                            height: 24,
                            child: Stack(
                              children: [
                                const Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Text(
                                    'Danh mục:',
                                    style: TextStyle(
                                      color: Color(0xFF288463),
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 111,
                                  top: 0,
                                  child: Container(
                                    width: 83,
                                    height: 24,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 83,
                                            height: 24,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFFFCFFEC),
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(width: 1, color: Color(0xFF288463)),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          left: 16,
                                          top: 3,
                                          child: Text(
                                            'Cà phê',
                                            style: TextStyle(
                                              color: Color(0xFF288463),
                                              fontSize: 15,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}