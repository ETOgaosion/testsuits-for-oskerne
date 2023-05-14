
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/unlink:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0e20006f          	j	10e4 <__start_main>

0000000000001006 <test_unlink>:
 * 测试失败，应有如下输出：
 * "  unlink error!"
 */

int test_unlink()
{
    1006:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	01850513          	addi	a0,a0,24 # 2020 <__clone+0x2c>
{
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1014:	2d0000ef          	jal	ra,12e4 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	0c050513          	addi	a0,a0,192 # 20d8 <__func__.1211>
    1020:	2c4000ef          	jal	ra,12e4 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	01450513          	addi	a0,a0,20 # 2038 <__clone+0x44>
    102c:	2b8000ef          	jal	ra,12e4 <puts>

    char *fname = "./test_unlink";
    int fd, ret;

    fd = open(fname, O_CREATE | O_WRONLY);
    1030:	04100593          	li	a1,65
    1034:	00001517          	auipc	a0,0x1
    1038:	01450513          	addi	a0,a0,20 # 2048 <__clone+0x54>
    103c:	541000ef          	jal	ra,1d7c <open>
    1040:	842a                	mv	s0,a0
    assert(fd > 0);
    1042:	08a05263          	blez	a0,10c6 <test_unlink+0xc0>
    close(fd);
    1046:	8522                	mv	a0,s0
    1048:	55d000ef          	jal	ra,1da4 <close>

    // unlink test
    ret = unlink(fname);
    104c:	00001517          	auipc	a0,0x1
    1050:	ffc50513          	addi	a0,a0,-4 # 2048 <__clone+0x54>
    1054:	6fd000ef          	jal	ra,1f50 <unlink>
    assert(ret == 0);
    1058:	e125                	bnez	a0,10b8 <test_unlink+0xb2>
    fd = open(fname, O_RDONLY);
    105a:	4581                	li	a1,0
    105c:	00001517          	auipc	a0,0x1
    1060:	fec50513          	addi	a0,a0,-20 # 2048 <__clone+0x54>
    1064:	519000ef          	jal	ra,1d7c <open>
    1068:	842a                	mv	s0,a0
    if(fd < 0){
    106a:	04054063          	bltz	a0,10aa <test_unlink+0xa4>
        printf("  unlink success!\n");
    }else{
	printf("  unlink error!\n");
    106e:	00001517          	auipc	a0,0x1
    1072:	02250513          	addi	a0,a0,34 # 2090 <__clone+0x9c>
    1076:	290000ef          	jal	ra,1306 <printf>
        close(fd);
    107a:	8522                	mv	a0,s0
    107c:	529000ef          	jal	ra,1da4 <close>
    }
    // It's Ok if you don't delete the inode and data blocks.

    TEST_END(__func__);
    1080:	00001517          	auipc	a0,0x1
    1084:	02850513          	addi	a0,a0,40 # 20a8 <__clone+0xb4>
    1088:	25c000ef          	jal	ra,12e4 <puts>
    108c:	00001517          	auipc	a0,0x1
    1090:	04c50513          	addi	a0,a0,76 # 20d8 <__func__.1211>
    1094:	250000ef          	jal	ra,12e4 <puts>
}
    1098:	6402                	ld	s0,0(sp)
    109a:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    109c:	00001517          	auipc	a0,0x1
    10a0:	f9c50513          	addi	a0,a0,-100 # 2038 <__clone+0x44>
}
    10a4:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    10a6:	23e0006f          	j	12e4 <puts>
        printf("  unlink success!\n");
    10aa:	00001517          	auipc	a0,0x1
    10ae:	fce50513          	addi	a0,a0,-50 # 2078 <__clone+0x84>
    10b2:	254000ef          	jal	ra,1306 <printf>
    10b6:	b7e9                	j	1080 <test_unlink+0x7a>
    assert(ret == 0);
    10b8:	00001517          	auipc	a0,0x1
    10bc:	fa050513          	addi	a0,a0,-96 # 2058 <__clone+0x64>
    10c0:	4ea000ef          	jal	ra,15aa <panic>
    10c4:	bf59                	j	105a <test_unlink+0x54>
    assert(fd > 0);
    10c6:	00001517          	auipc	a0,0x1
    10ca:	f9250513          	addi	a0,a0,-110 # 2058 <__clone+0x64>
    10ce:	4dc000ef          	jal	ra,15aa <panic>
    10d2:	bf95                	j	1046 <test_unlink+0x40>

00000000000010d4 <main>:

int main(void) {
    10d4:	1141                	addi	sp,sp,-16
    10d6:	e406                	sd	ra,8(sp)
	test_unlink();
    10d8:	f2fff0ef          	jal	ra,1006 <test_unlink>
	return 0;
}
    10dc:	60a2                	ld	ra,8(sp)
    10de:	4501                	li	a0,0
    10e0:	0141                	addi	sp,sp,16
    10e2:	8082                	ret

00000000000010e4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10e4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10e6:	4108                	lw	a0,0(a0)
{
    10e8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ea:	05a1                	addi	a1,a1,8
{
    10ec:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ee:	fe7ff0ef          	jal	ra,10d4 <main>
    10f2:	51b000ef          	jal	ra,1e0c <exit>
	return 0;
}
    10f6:	60a2                	ld	ra,8(sp)
    10f8:	4501                	li	a0,0
    10fa:	0141                	addi	sp,sp,16
    10fc:	8082                	ret

00000000000010fe <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10fe:	7179                	addi	sp,sp,-48
    1100:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1102:	12054e63          	bltz	a0,123e <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1106:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    110a:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    110c:	02b7f6bb          	remuw	a3,a5,a1
    1110:	00001717          	auipc	a4,0x1
    1114:	fd870713          	addi	a4,a4,-40 # 20e8 <digits>
    buf[16] = 0;
    1118:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    111c:	1682                	slli	a3,a3,0x20
    111e:	9281                	srli	a3,a3,0x20
    1120:	96ba                	add	a3,a3,a4
    1122:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1126:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    112a:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    112e:	16b7e363          	bltu	a5,a1,1294 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1132:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1136:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    113a:	1602                	slli	a2,a2,0x20
    113c:	9201                	srli	a2,a2,0x20
    113e:	963a                	add	a2,a2,a4
    1140:	00064603          	lbu	a2,0(a2)
    1144:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1148:	0007861b          	sext.w	a2,a5
    114c:	12b6e863          	bltu	a3,a1,127c <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1150:	02b7f6bb          	remuw	a3,a5,a1
    1154:	1682                	slli	a3,a3,0x20
    1156:	9281                	srli	a3,a3,0x20
    1158:	96ba                	add	a3,a3,a4
    115a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    115e:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1162:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1166:	10b66e63          	bltu	a2,a1,1282 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    116a:	02b876bb          	remuw	a3,a6,a1
    116e:	1682                	slli	a3,a3,0x20
    1170:	9281                	srli	a3,a3,0x20
    1172:	96ba                	add	a3,a3,a4
    1174:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1178:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    117c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1180:	10b86463          	bltu	a6,a1,1288 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1184:	02b676bb          	remuw	a3,a2,a1
    1188:	1682                	slli	a3,a3,0x20
    118a:	9281                	srli	a3,a3,0x20
    118c:	96ba                	add	a3,a3,a4
    118e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1192:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1196:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    119a:	0eb66a63          	bltu	a2,a1,128e <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    119e:	02b876bb          	remuw	a3,a6,a1
    11a2:	1682                	slli	a3,a3,0x20
    11a4:	9281                	srli	a3,a3,0x20
    11a6:	96ba                	add	a3,a3,a4
    11a8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ac:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11b0:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    11b4:	0cb86163          	bltu	a6,a1,1276 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    11b8:	02b676bb          	remuw	a3,a2,a1
    11bc:	1682                	slli	a3,a3,0x20
    11be:	9281                	srli	a3,a3,0x20
    11c0:	96ba                	add	a3,a3,a4
    11c2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c6:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11ca:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11ce:	0cb66563          	bltu	a2,a1,1298 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11d2:	02b876bb          	remuw	a3,a6,a1
    11d6:	1682                	slli	a3,a3,0x20
    11d8:	9281                	srli	a3,a3,0x20
    11da:	96ba                	add	a3,a3,a4
    11dc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11e0:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11e4:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11e8:	0ab86b63          	bltu	a6,a1,129e <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11ec:	02b676bb          	remuw	a3,a2,a1
    11f0:	1682                	slli	a3,a3,0x20
    11f2:	9281                	srli	a3,a3,0x20
    11f4:	96ba                	add	a3,a3,a4
    11f6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11fa:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11fe:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1202:	0ab66163          	bltu	a2,a1,12a4 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1206:	1782                	slli	a5,a5,0x20
    1208:	9381                	srli	a5,a5,0x20
    120a:	97ba                	add	a5,a5,a4
    120c:	0007c703          	lbu	a4,0(a5)
    1210:	4599                	li	a1,6
    1212:	4795                	li	a5,5
    1214:	00e10723          	sb	a4,14(sp)

    if (sign)
    1218:	00055963          	bgez	a0,122a <printint.constprop.0+0x12c>
        buf[i--] = '-';
    121c:	1018                	addi	a4,sp,32
    121e:	973e                	add	a4,a4,a5
    1220:	02d00693          	li	a3,45
    1224:	fed70423          	sb	a3,-24(a4)
    1228:	85be                	mv	a1,a5
    write(f, s, l);
    122a:	003c                	addi	a5,sp,8
    122c:	4641                	li	a2,16
    122e:	9e0d                	subw	a2,a2,a1
    1230:	4505                	li	a0,1
    1232:	95be                	add	a1,a1,a5
    1234:	387000ef          	jal	ra,1dba <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1238:	70a2                	ld	ra,40(sp)
    123a:	6145                	addi	sp,sp,48
    123c:	8082                	ret
        x = -xx;
    123e:	40a0063b          	negw	a2,a0
    1242:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1244:	02b677bb          	remuw	a5,a2,a1
    1248:	00001717          	auipc	a4,0x1
    124c:	ea070713          	addi	a4,a4,-352 # 20e8 <digits>
    buf[16] = 0;
    1250:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1254:	1782                	slli	a5,a5,0x20
    1256:	9381                	srli	a5,a5,0x20
    1258:	97ba                	add	a5,a5,a4
    125a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    125e:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1262:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1266:	ecb676e3          	bleu	a1,a2,1132 <printint.constprop.0+0x34>
        buf[i--] = '-';
    126a:	02d00793          	li	a5,45
    126e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1272:	45b9                	li	a1,14
    1274:	bf5d                	j	122a <printint.constprop.0+0x12c>
    1276:	47a5                	li	a5,9
    1278:	45a9                	li	a1,10
    127a:	bf79                	j	1218 <printint.constprop.0+0x11a>
    127c:	47b5                	li	a5,13
    127e:	45b9                	li	a1,14
    1280:	bf61                	j	1218 <printint.constprop.0+0x11a>
    1282:	47b1                	li	a5,12
    1284:	45b5                	li	a1,13
    1286:	bf49                	j	1218 <printint.constprop.0+0x11a>
    1288:	47ad                	li	a5,11
    128a:	45b1                	li	a1,12
    128c:	b771                	j	1218 <printint.constprop.0+0x11a>
    128e:	47a9                	li	a5,10
    1290:	45ad                	li	a1,11
    1292:	b759                	j	1218 <printint.constprop.0+0x11a>
    i = 15;
    1294:	45bd                	li	a1,15
    1296:	bf51                	j	122a <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1298:	47a1                	li	a5,8
    129a:	45a5                	li	a1,9
    129c:	bfb5                	j	1218 <printint.constprop.0+0x11a>
    129e:	479d                	li	a5,7
    12a0:	45a1                	li	a1,8
    12a2:	bf9d                	j	1218 <printint.constprop.0+0x11a>
    12a4:	4799                	li	a5,6
    12a6:	459d                	li	a1,7
    12a8:	bf85                	j	1218 <printint.constprop.0+0x11a>

00000000000012aa <getchar>:
{
    12aa:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    12ac:	00f10593          	addi	a1,sp,15
    12b0:	4605                	li	a2,1
    12b2:	4501                	li	a0,0
{
    12b4:	ec06                	sd	ra,24(sp)
    char byte = 0;
    12b6:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    12ba:	2f7000ef          	jal	ra,1db0 <read>
}
    12be:	60e2                	ld	ra,24(sp)
    12c0:	00f14503          	lbu	a0,15(sp)
    12c4:	6105                	addi	sp,sp,32
    12c6:	8082                	ret

00000000000012c8 <putchar>:
{
    12c8:	1101                	addi	sp,sp,-32
    char byte = c;
    12ca:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12ce:	00f10593          	addi	a1,sp,15
    12d2:	4605                	li	a2,1
    12d4:	4505                	li	a0,1
{
    12d6:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12d8:	2e3000ef          	jal	ra,1dba <write>
}
    12dc:	60e2                	ld	ra,24(sp)
    12de:	2501                	sext.w	a0,a0
    12e0:	6105                	addi	sp,sp,32
    12e2:	8082                	ret

00000000000012e4 <puts>:
{
    12e4:	1141                	addi	sp,sp,-16
    12e6:	e406                	sd	ra,8(sp)
    12e8:	e022                	sd	s0,0(sp)
    12ea:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12ec:	5b2000ef          	jal	ra,189e <strlen>
    12f0:	862a                	mv	a2,a0
    12f2:	85a2                	mv	a1,s0
    12f4:	4505                	li	a0,1
    12f6:	2c5000ef          	jal	ra,1dba <write>
}
    12fa:	60a2                	ld	ra,8(sp)
    12fc:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12fe:	957d                	srai	a0,a0,0x3f
    return r;
    1300:	2501                	sext.w	a0,a0
}
    1302:	0141                	addi	sp,sp,16
    1304:	8082                	ret

0000000000001306 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1306:	7131                	addi	sp,sp,-192
    1308:	e0da                	sd	s6,64(sp)
    130a:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    130c:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    130e:	013c                	addi	a5,sp,136
{
    1310:	f0ca                	sd	s2,96(sp)
    1312:	ecce                	sd	s3,88(sp)
    1314:	e8d2                	sd	s4,80(sp)
    1316:	e4d6                	sd	s5,72(sp)
    1318:	fc5e                	sd	s7,56(sp)
    131a:	fc86                	sd	ra,120(sp)
    131c:	f8a2                	sd	s0,112(sp)
    131e:	f4a6                	sd	s1,104(sp)
    1320:	89aa                	mv	s3,a0
    1322:	e52e                	sd	a1,136(sp)
    1324:	e932                	sd	a2,144(sp)
    1326:	ed36                	sd	a3,152(sp)
    1328:	f13a                	sd	a4,160(sp)
    132a:	f942                	sd	a6,176(sp)
    132c:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    132e:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1330:	02500913          	li	s2,37
    1334:	07000a93          	li	s5,112
    buf[i++] = '0';
    1338:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    133c:	00001a17          	auipc	s4,0x1
    1340:	daca0a13          	addi	s4,s4,-596 # 20e8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1344:	00001b97          	auipc	s7,0x1
    1348:	d74b8b93          	addi	s7,s7,-652 # 20b8 <__clone+0xc4>
        if (!*s)
    134c:	0009c783          	lbu	a5,0(s3)
    1350:	cfb9                	beqz	a5,13ae <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1352:	23278d63          	beq	a5,s2,158c <printf+0x286>
    1356:	864e                	mv	a2,s3
    1358:	a019                	j	135e <printf+0x58>
    135a:	07278563          	beq	a5,s2,13c4 <printf+0xbe>
    135e:	0605                	addi	a2,a2,1
    1360:	00064783          	lbu	a5,0(a2)
    1364:	fbfd                	bnez	a5,135a <printf+0x54>
    1366:	84b2                	mv	s1,a2
        l = z - a;
    1368:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    136c:	8622                	mv	a2,s0
    136e:	85ce                	mv	a1,s3
    1370:	4505                	li	a0,1
    1372:	249000ef          	jal	ra,1dba <write>
        if (l)
    1376:	ec3d                	bnez	s0,13f4 <printf+0xee>
        if (s[1] == 0)
    1378:	0014c783          	lbu	a5,1(s1)
    137c:	cb8d                	beqz	a5,13ae <printf+0xa8>
        switch (s[1])
    137e:	09578b63          	beq	a5,s5,1414 <printf+0x10e>
    1382:	06fafb63          	bleu	a5,s5,13f8 <printf+0xf2>
    1386:	07300713          	li	a4,115
    138a:	1ce78e63          	beq	a5,a4,1566 <printf+0x260>
    138e:	07800713          	li	a4,120
    1392:	1ae79563          	bne	a5,a4,153c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1396:	6782                	ld	a5,0(sp)
    1398:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    139a:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    139e:	4388                	lw	a0,0(a5)
    13a0:	07a1                	addi	a5,a5,8
    13a2:	e03e                	sd	a5,0(sp)
    13a4:	d5bff0ef          	jal	ra,10fe <printint.constprop.0>
        if (!*s)
    13a8:	0009c783          	lbu	a5,0(s3)
    13ac:	f3dd                	bnez	a5,1352 <printf+0x4c>
    }
    va_end(ap);
}
    13ae:	70e6                	ld	ra,120(sp)
    13b0:	7446                	ld	s0,112(sp)
    13b2:	74a6                	ld	s1,104(sp)
    13b4:	7906                	ld	s2,96(sp)
    13b6:	69e6                	ld	s3,88(sp)
    13b8:	6a46                	ld	s4,80(sp)
    13ba:	6aa6                	ld	s5,72(sp)
    13bc:	6b06                	ld	s6,64(sp)
    13be:	7be2                	ld	s7,56(sp)
    13c0:	6129                	addi	sp,sp,192
    13c2:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13c4:	00164783          	lbu	a5,1(a2)
    13c8:	84b2                	mv	s1,a2
    13ca:	01278763          	beq	a5,s2,13d8 <printf+0xd2>
    13ce:	bf69                	j	1368 <printf+0x62>
    13d0:	0014c783          	lbu	a5,1(s1)
    13d4:	f9279ae3          	bne	a5,s2,1368 <printf+0x62>
    13d8:	0489                	addi	s1,s1,2
    13da:	0004c783          	lbu	a5,0(s1)
    13de:	0605                	addi	a2,a2,1
    13e0:	ff2788e3          	beq	a5,s2,13d0 <printf+0xca>
        l = z - a;
    13e4:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13e8:	8622                	mv	a2,s0
    13ea:	85ce                	mv	a1,s3
    13ec:	4505                	li	a0,1
    13ee:	1cd000ef          	jal	ra,1dba <write>
        if (l)
    13f2:	d059                	beqz	s0,1378 <printf+0x72>
    13f4:	89a6                	mv	s3,s1
    13f6:	bf99                	j	134c <printf+0x46>
    13f8:	06400713          	li	a4,100
    13fc:	14e79063          	bne	a5,a4,153c <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    1400:	6782                	ld	a5,0(sp)
    1402:	45a9                	li	a1,10
        s += 2;
    1404:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1408:	4388                	lw	a0,0(a5)
    140a:	07a1                	addi	a5,a5,8
    140c:	e03e                	sd	a5,0(sp)
    140e:	cf1ff0ef          	jal	ra,10fe <printint.constprop.0>
        s += 2;
    1412:	bf59                	j	13a8 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1414:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1416:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    141a:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    141c:	631c                	ld	a5,0(a4)
    141e:	0721                	addi	a4,a4,8
    1420:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1422:	00479293          	slli	t0,a5,0x4
    1426:	00879f93          	slli	t6,a5,0x8
    142a:	00c79f13          	slli	t5,a5,0xc
    142e:	01079e93          	slli	t4,a5,0x10
    1432:	01479e13          	slli	t3,a5,0x14
    1436:	01879313          	slli	t1,a5,0x18
    143a:	01c79893          	slli	a7,a5,0x1c
    143e:	02479813          	slli	a6,a5,0x24
    1442:	02879513          	slli	a0,a5,0x28
    1446:	02c79593          	slli	a1,a5,0x2c
    144a:	03079693          	slli	a3,a5,0x30
    144e:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1452:	03c7d413          	srli	s0,a5,0x3c
    1456:	01c7d39b          	srliw	t2,a5,0x1c
    145a:	03c2d293          	srli	t0,t0,0x3c
    145e:	03cfdf93          	srli	t6,t6,0x3c
    1462:	03cf5f13          	srli	t5,t5,0x3c
    1466:	03cede93          	srli	t4,t4,0x3c
    146a:	03ce5e13          	srli	t3,t3,0x3c
    146e:	03c35313          	srli	t1,t1,0x3c
    1472:	03c8d893          	srli	a7,a7,0x3c
    1476:	03c85813          	srli	a6,a6,0x3c
    147a:	9171                	srli	a0,a0,0x3c
    147c:	91f1                	srli	a1,a1,0x3c
    147e:	92f1                	srli	a3,a3,0x3c
    1480:	9371                	srli	a4,a4,0x3c
    1482:	96d2                	add	a3,a3,s4
    1484:	9752                	add	a4,a4,s4
    1486:	9452                	add	s0,s0,s4
    1488:	92d2                	add	t0,t0,s4
    148a:	9fd2                	add	t6,t6,s4
    148c:	9f52                	add	t5,t5,s4
    148e:	9ed2                	add	t4,t4,s4
    1490:	9e52                	add	t3,t3,s4
    1492:	9352                	add	t1,t1,s4
    1494:	98d2                	add	a7,a7,s4
    1496:	93d2                	add	t2,t2,s4
    1498:	9852                	add	a6,a6,s4
    149a:	9552                	add	a0,a0,s4
    149c:	95d2                	add	a1,a1,s4
    149e:	0006c983          	lbu	s3,0(a3)
    14a2:	0002c283          	lbu	t0,0(t0)
    14a6:	00074683          	lbu	a3,0(a4)
    14aa:	000fcf83          	lbu	t6,0(t6)
    14ae:	000f4f03          	lbu	t5,0(t5)
    14b2:	000ece83          	lbu	t4,0(t4)
    14b6:	000e4e03          	lbu	t3,0(t3)
    14ba:	00034303          	lbu	t1,0(t1)
    14be:	0008c883          	lbu	a7,0(a7)
    14c2:	0003c383          	lbu	t2,0(t2)
    14c6:	00084803          	lbu	a6,0(a6)
    14ca:	00054503          	lbu	a0,0(a0)
    14ce:	0005c583          	lbu	a1,0(a1)
    14d2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14d6:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14da:	9371                	srli	a4,a4,0x3c
    14dc:	8bbd                	andi	a5,a5,15
    14de:	9752                	add	a4,a4,s4
    14e0:	97d2                	add	a5,a5,s4
    14e2:	005105a3          	sb	t0,11(sp)
    14e6:	01f10623          	sb	t6,12(sp)
    14ea:	01e106a3          	sb	t5,13(sp)
    14ee:	01d10723          	sb	t4,14(sp)
    14f2:	01c107a3          	sb	t3,15(sp)
    14f6:	00610823          	sb	t1,16(sp)
    14fa:	011108a3          	sb	a7,17(sp)
    14fe:	00710923          	sb	t2,18(sp)
    1502:	010109a3          	sb	a6,19(sp)
    1506:	00a10a23          	sb	a0,20(sp)
    150a:	00b10aa3          	sb	a1,21(sp)
    150e:	01310b23          	sb	s3,22(sp)
    1512:	00d10ba3          	sb	a3,23(sp)
    1516:	00810523          	sb	s0,10(sp)
    151a:	00074703          	lbu	a4,0(a4)
    151e:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1522:	002c                	addi	a1,sp,8
    1524:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1526:	00e10c23          	sb	a4,24(sp)
    152a:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    152e:	00010d23          	sb	zero,26(sp)
        s += 2;
    1532:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1536:	085000ef          	jal	ra,1dba <write>
        s += 2;
    153a:	b5bd                	j	13a8 <printf+0xa2>
    char byte = c;
    153c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1540:	4605                	li	a2,1
    1542:	002c                	addi	a1,sp,8
    1544:	4505                	li	a0,1
    char byte = c;
    1546:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    154a:	071000ef          	jal	ra,1dba <write>
    char byte = c;
    154e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1552:	4605                	li	a2,1
    1554:	002c                	addi	a1,sp,8
    1556:	4505                	li	a0,1
    char byte = c;
    1558:	00f10423          	sb	a5,8(sp)
        s += 2;
    155c:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1560:	05b000ef          	jal	ra,1dba <write>
        s += 2;
    1564:	b591                	j	13a8 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1566:	6782                	ld	a5,0(sp)
    1568:	6380                	ld	s0,0(a5)
    156a:	07a1                	addi	a5,a5,8
    156c:	e03e                	sd	a5,0(sp)
    156e:	cc05                	beqz	s0,15a6 <printf+0x2a0>
            l = strnlen(a, 200);
    1570:	0c800593          	li	a1,200
    1574:	8522                	mv	a0,s0
    1576:	45a000ef          	jal	ra,19d0 <strnlen>
    write(f, s, l);
    157a:	0005061b          	sext.w	a2,a0
    157e:	85a2                	mv	a1,s0
    1580:	4505                	li	a0,1
    1582:	039000ef          	jal	ra,1dba <write>
        s += 2;
    1586:	00248993          	addi	s3,s1,2
    158a:	bd39                	j	13a8 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    158c:	0019c783          	lbu	a5,1(s3)
    1590:	84ce                	mv	s1,s3
    1592:	864e                	mv	a2,s3
    1594:	e52782e3          	beq	a5,s2,13d8 <printf+0xd2>
    write(f, s, l);
    1598:	4601                	li	a2,0
    159a:	85ce                	mv	a1,s3
    159c:	4505                	li	a0,1
    159e:	01d000ef          	jal	ra,1dba <write>
    15a2:	84ce                	mv	s1,s3
    15a4:	bbd1                	j	1378 <printf+0x72>
                a = "(null)";
    15a6:	845e                	mv	s0,s7
    15a8:	b7e1                	j	1570 <printf+0x26a>

00000000000015aa <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    15aa:	1141                	addi	sp,sp,-16
    15ac:	e406                	sd	ra,8(sp)
    puts(m);
    15ae:	d37ff0ef          	jal	ra,12e4 <puts>
    exit(-100);
}
    15b2:	60a2                	ld	ra,8(sp)
    exit(-100);
    15b4:	f9c00513          	li	a0,-100
}
    15b8:	0141                	addi	sp,sp,16
    exit(-100);
    15ba:	0530006f          	j	1e0c <exit>

00000000000015be <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    15be:	02000793          	li	a5,32
    15c2:	00f50663          	beq	a0,a5,15ce <isspace+0x10>
    15c6:	355d                	addiw	a0,a0,-9
    15c8:	00553513          	sltiu	a0,a0,5
    15cc:	8082                	ret
    15ce:	4505                	li	a0,1
}
    15d0:	8082                	ret

00000000000015d2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15d2:	fd05051b          	addiw	a0,a0,-48
}
    15d6:	00a53513          	sltiu	a0,a0,10
    15da:	8082                	ret

00000000000015dc <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15dc:	02000613          	li	a2,32
    15e0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15e2:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15e6:	0007079b          	sext.w	a5,a4
    15ea:	ff77869b          	addiw	a3,a5,-9
    15ee:	04c70b63          	beq	a4,a2,1644 <atoi+0x68>
    15f2:	04d5f963          	bleu	a3,a1,1644 <atoi+0x68>
        s++;
    switch (*s)
    15f6:	02b00693          	li	a3,43
    15fa:	04d70a63          	beq	a4,a3,164e <atoi+0x72>
    15fe:	02d00693          	li	a3,45
    1602:	06d70463          	beq	a4,a3,166a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1606:	fd07859b          	addiw	a1,a5,-48
    160a:	4625                	li	a2,9
    160c:	873e                	mv	a4,a5
    160e:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    1610:	4e01                	li	t3,0
    while (isdigit(*s))
    1612:	04b66a63          	bltu	a2,a1,1666 <atoi+0x8a>
    int n = 0, neg = 0;
    1616:	4501                	li	a0,0
    while (isdigit(*s))
    1618:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    161a:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    161c:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    1620:	0025179b          	slliw	a5,a0,0x2
    1624:	9d3d                	addw	a0,a0,a5
    1626:	fd07031b          	addiw	t1,a4,-48
    162a:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    162e:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1632:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1636:	0006071b          	sext.w	a4,a2
    163a:	feb870e3          	bleu	a1,a6,161a <atoi+0x3e>
    return neg ? n : -n;
    163e:	000e0563          	beqz	t3,1648 <atoi+0x6c>
}
    1642:	8082                	ret
        s++;
    1644:	0505                	addi	a0,a0,1
    1646:	bf71                	j	15e2 <atoi+0x6>
    1648:	4113053b          	subw	a0,t1,a7
    164c:	8082                	ret
    while (isdigit(*s))
    164e:	00154783          	lbu	a5,1(a0)
    1652:	4625                	li	a2,9
        s++;
    1654:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1658:	fd07859b          	addiw	a1,a5,-48
    165c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1660:	4e01                	li	t3,0
    while (isdigit(*s))
    1662:	fab67ae3          	bleu	a1,a2,1616 <atoi+0x3a>
    1666:	4501                	li	a0,0
}
    1668:	8082                	ret
    while (isdigit(*s))
    166a:	00154783          	lbu	a5,1(a0)
    166e:	4625                	li	a2,9
        s++;
    1670:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1674:	fd07859b          	addiw	a1,a5,-48
    1678:	0007871b          	sext.w	a4,a5
    167c:	feb665e3          	bltu	a2,a1,1666 <atoi+0x8a>
        neg = 1;
    1680:	4e05                	li	t3,1
    1682:	bf51                	j	1616 <atoi+0x3a>

0000000000001684 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1684:	16060d63          	beqz	a2,17fe <memset+0x17a>
    1688:	40a007b3          	neg	a5,a0
    168c:	8b9d                	andi	a5,a5,7
    168e:	00778713          	addi	a4,a5,7
    1692:	482d                	li	a6,11
    1694:	0ff5f593          	andi	a1,a1,255
    1698:	fff60693          	addi	a3,a2,-1
    169c:	17076263          	bltu	a4,a6,1800 <memset+0x17c>
    16a0:	16e6ea63          	bltu	a3,a4,1814 <memset+0x190>
    16a4:	16078563          	beqz	a5,180e <memset+0x18a>
    16a8:	00b50023          	sb	a1,0(a0)
    16ac:	4705                	li	a4,1
    16ae:	00150e93          	addi	t4,a0,1
    16b2:	14e78c63          	beq	a5,a4,180a <memset+0x186>
    16b6:	00b500a3          	sb	a1,1(a0)
    16ba:	4709                	li	a4,2
    16bc:	00250e93          	addi	t4,a0,2
    16c0:	14e78d63          	beq	a5,a4,181a <memset+0x196>
    16c4:	00b50123          	sb	a1,2(a0)
    16c8:	470d                	li	a4,3
    16ca:	00350e93          	addi	t4,a0,3
    16ce:	12e78b63          	beq	a5,a4,1804 <memset+0x180>
    16d2:	00b501a3          	sb	a1,3(a0)
    16d6:	4711                	li	a4,4
    16d8:	00450e93          	addi	t4,a0,4
    16dc:	14e78163          	beq	a5,a4,181e <memset+0x19a>
    16e0:	00b50223          	sb	a1,4(a0)
    16e4:	4715                	li	a4,5
    16e6:	00550e93          	addi	t4,a0,5
    16ea:	12e78c63          	beq	a5,a4,1822 <memset+0x19e>
    16ee:	00b502a3          	sb	a1,5(a0)
    16f2:	471d                	li	a4,7
    16f4:	00650e93          	addi	t4,a0,6
    16f8:	12e79763          	bne	a5,a4,1826 <memset+0x1a2>
    16fc:	00750e93          	addi	t4,a0,7
    1700:	00b50323          	sb	a1,6(a0)
    1704:	4f1d                	li	t5,7
    1706:	00859713          	slli	a4,a1,0x8
    170a:	8f4d                	or	a4,a4,a1
    170c:	01059e13          	slli	t3,a1,0x10
    1710:	01c76e33          	or	t3,a4,t3
    1714:	01859313          	slli	t1,a1,0x18
    1718:	006e6333          	or	t1,t3,t1
    171c:	02059893          	slli	a7,a1,0x20
    1720:	011368b3          	or	a7,t1,a7
    1724:	02859813          	slli	a6,a1,0x28
    1728:	40f60333          	sub	t1,a2,a5
    172c:	0108e833          	or	a6,a7,a6
    1730:	03059693          	slli	a3,a1,0x30
    1734:	00d866b3          	or	a3,a6,a3
    1738:	03859713          	slli	a4,a1,0x38
    173c:	97aa                	add	a5,a5,a0
    173e:	ff837813          	andi	a6,t1,-8
    1742:	8f55                	or	a4,a4,a3
    1744:	00f806b3          	add	a3,a6,a5
    1748:	e398                	sd	a4,0(a5)
    174a:	07a1                	addi	a5,a5,8
    174c:	fed79ee3          	bne	a5,a3,1748 <memset+0xc4>
    1750:	ff837693          	andi	a3,t1,-8
    1754:	00de87b3          	add	a5,t4,a3
    1758:	01e6873b          	addw	a4,a3,t5
    175c:	0ad30663          	beq	t1,a3,1808 <memset+0x184>
    1760:	00b78023          	sb	a1,0(a5)
    1764:	0017069b          	addiw	a3,a4,1
    1768:	08c6fb63          	bleu	a2,a3,17fe <memset+0x17a>
    176c:	00b780a3          	sb	a1,1(a5)
    1770:	0027069b          	addiw	a3,a4,2
    1774:	08c6f563          	bleu	a2,a3,17fe <memset+0x17a>
    1778:	00b78123          	sb	a1,2(a5)
    177c:	0037069b          	addiw	a3,a4,3
    1780:	06c6ff63          	bleu	a2,a3,17fe <memset+0x17a>
    1784:	00b781a3          	sb	a1,3(a5)
    1788:	0047069b          	addiw	a3,a4,4
    178c:	06c6f963          	bleu	a2,a3,17fe <memset+0x17a>
    1790:	00b78223          	sb	a1,4(a5)
    1794:	0057069b          	addiw	a3,a4,5
    1798:	06c6f363          	bleu	a2,a3,17fe <memset+0x17a>
    179c:	00b782a3          	sb	a1,5(a5)
    17a0:	0067069b          	addiw	a3,a4,6
    17a4:	04c6fd63          	bleu	a2,a3,17fe <memset+0x17a>
    17a8:	00b78323          	sb	a1,6(a5)
    17ac:	0077069b          	addiw	a3,a4,7
    17b0:	04c6f763          	bleu	a2,a3,17fe <memset+0x17a>
    17b4:	00b783a3          	sb	a1,7(a5)
    17b8:	0087069b          	addiw	a3,a4,8
    17bc:	04c6f163          	bleu	a2,a3,17fe <memset+0x17a>
    17c0:	00b78423          	sb	a1,8(a5)
    17c4:	0097069b          	addiw	a3,a4,9
    17c8:	02c6fb63          	bleu	a2,a3,17fe <memset+0x17a>
    17cc:	00b784a3          	sb	a1,9(a5)
    17d0:	00a7069b          	addiw	a3,a4,10
    17d4:	02c6f563          	bleu	a2,a3,17fe <memset+0x17a>
    17d8:	00b78523          	sb	a1,10(a5)
    17dc:	00b7069b          	addiw	a3,a4,11
    17e0:	00c6ff63          	bleu	a2,a3,17fe <memset+0x17a>
    17e4:	00b785a3          	sb	a1,11(a5)
    17e8:	00c7069b          	addiw	a3,a4,12
    17ec:	00c6f963          	bleu	a2,a3,17fe <memset+0x17a>
    17f0:	00b78623          	sb	a1,12(a5)
    17f4:	2735                	addiw	a4,a4,13
    17f6:	00c77463          	bleu	a2,a4,17fe <memset+0x17a>
    17fa:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17fe:	8082                	ret
    1800:	472d                	li	a4,11
    1802:	bd79                	j	16a0 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1804:	4f0d                	li	t5,3
    1806:	b701                	j	1706 <memset+0x82>
    1808:	8082                	ret
    180a:	4f05                	li	t5,1
    180c:	bded                	j	1706 <memset+0x82>
    180e:	8eaa                	mv	t4,a0
    1810:	4f01                	li	t5,0
    1812:	bdd5                	j	1706 <memset+0x82>
    1814:	87aa                	mv	a5,a0
    1816:	4701                	li	a4,0
    1818:	b7a1                	j	1760 <memset+0xdc>
    181a:	4f09                	li	t5,2
    181c:	b5ed                	j	1706 <memset+0x82>
    181e:	4f11                	li	t5,4
    1820:	b5dd                	j	1706 <memset+0x82>
    1822:	4f15                	li	t5,5
    1824:	b5cd                	j	1706 <memset+0x82>
    1826:	4f19                	li	t5,6
    1828:	bdf9                	j	1706 <memset+0x82>

000000000000182a <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    182a:	00054703          	lbu	a4,0(a0)
    182e:	0005c783          	lbu	a5,0(a1)
    1832:	00e79b63          	bne	a5,a4,1848 <strcmp+0x1e>
    1836:	cf89                	beqz	a5,1850 <strcmp+0x26>
    1838:	0505                	addi	a0,a0,1
    183a:	0585                	addi	a1,a1,1
    183c:	0005c783          	lbu	a5,0(a1)
    1840:	00054703          	lbu	a4,0(a0)
    1844:	fef709e3          	beq	a4,a5,1836 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1848:	0007051b          	sext.w	a0,a4
}
    184c:	9d1d                	subw	a0,a0,a5
    184e:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1850:	4501                	li	a0,0
}
    1852:	9d1d                	subw	a0,a0,a5
    1854:	8082                	ret

0000000000001856 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1856:	c231                	beqz	a2,189a <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1858:	00054783          	lbu	a5,0(a0)
    185c:	0005c683          	lbu	a3,0(a1)
    1860:	c795                	beqz	a5,188c <strncmp+0x36>
    1862:	ca85                	beqz	a3,1892 <strncmp+0x3c>
    if (!n--)
    1864:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1866:	c615                	beqz	a2,1892 <strncmp+0x3c>
    1868:	00150713          	addi	a4,a0,1
    186c:	9532                	add	a0,a0,a2
    186e:	00d78963          	beq	a5,a3,1880 <strncmp+0x2a>
    1872:	a005                	j	1892 <strncmp+0x3c>
    1874:	ce99                	beqz	a3,1892 <strncmp+0x3c>
    1876:	00e50e63          	beq	a0,a4,1892 <strncmp+0x3c>
    187a:	0705                	addi	a4,a4,1
    187c:	00d79b63          	bne	a5,a3,1892 <strncmp+0x3c>
    1880:	00074783          	lbu	a5,0(a4)
    1884:	0585                	addi	a1,a1,1
    1886:	0005c683          	lbu	a3,0(a1)
    188a:	f7ed                	bnez	a5,1874 <strncmp+0x1e>
    188c:	4501                	li	a0,0
        ;
    return *l - *r;
    188e:	9d15                	subw	a0,a0,a3
    1890:	8082                	ret
    1892:	0007851b          	sext.w	a0,a5
    1896:	9d15                	subw	a0,a0,a3
    1898:	8082                	ret
        return 0;
    189a:	4501                	li	a0,0
}
    189c:	8082                	ret

000000000000189e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    189e:	00757793          	andi	a5,a0,7
    18a2:	cfa1                	beqz	a5,18fa <strlen+0x5c>
        if (!*s)
    18a4:	00054783          	lbu	a5,0(a0)
    18a8:	cbb9                	beqz	a5,18fe <strlen+0x60>
    18aa:	87aa                	mv	a5,a0
    18ac:	a021                	j	18b4 <strlen+0x16>
    18ae:	0007c703          	lbu	a4,0(a5)
    18b2:	c329                	beqz	a4,18f4 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    18b4:	0785                	addi	a5,a5,1
    18b6:	0077f713          	andi	a4,a5,7
    18ba:	fb75                	bnez	a4,18ae <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    18bc:	00001717          	auipc	a4,0x1
    18c0:	80470713          	addi	a4,a4,-2044 # 20c0 <__clone+0xcc>
    18c4:	630c                	ld	a1,0(a4)
    18c6:	00001717          	auipc	a4,0x1
    18ca:	80270713          	addi	a4,a4,-2046 # 20c8 <__clone+0xd4>
    18ce:	6394                	ld	a3,0(a5)
    18d0:	6310                	ld	a2,0(a4)
    18d2:	a019                	j	18d8 <strlen+0x3a>
    18d4:	07a1                	addi	a5,a5,8
    18d6:	6394                	ld	a3,0(a5)
    18d8:	00b68733          	add	a4,a3,a1
    18dc:	fff6c693          	not	a3,a3
    18e0:	8f75                	and	a4,a4,a3
    18e2:	8f71                	and	a4,a4,a2
    18e4:	db65                	beqz	a4,18d4 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18e6:	0007c703          	lbu	a4,0(a5)
    18ea:	c709                	beqz	a4,18f4 <strlen+0x56>
    18ec:	0785                	addi	a5,a5,1
    18ee:	0007c703          	lbu	a4,0(a5)
    18f2:	ff6d                	bnez	a4,18ec <strlen+0x4e>
        ;
    return s - a;
    18f4:	40a78533          	sub	a0,a5,a0
}
    18f8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18fa:	87aa                	mv	a5,a0
    18fc:	b7c1                	j	18bc <strlen+0x1e>
        if (!*s)
    18fe:	4501                	li	a0,0
            return s - a;
    1900:	8082                	ret

0000000000001902 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1902:	00757793          	andi	a5,a0,7
    1906:	0ff5f593          	andi	a1,a1,255
    190a:	cb99                	beqz	a5,1920 <memchr+0x1e>
    190c:	c655                	beqz	a2,19b8 <memchr+0xb6>
    190e:	00054783          	lbu	a5,0(a0)
    1912:	0ab78663          	beq	a5,a1,19be <memchr+0xbc>
    1916:	0505                	addi	a0,a0,1
    1918:	00757793          	andi	a5,a0,7
    191c:	167d                	addi	a2,a2,-1
    191e:	f7fd                	bnez	a5,190c <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    1920:	4701                	li	a4,0
    if (n && *s != c)
    1922:	ca49                	beqz	a2,19b4 <memchr+0xb2>
    1924:	00054783          	lbu	a5,0(a0)
    1928:	08b78b63          	beq	a5,a1,19be <memchr+0xbc>
        size_t k = ONES * c;
    192c:	00000797          	auipc	a5,0x0
    1930:	7a478793          	addi	a5,a5,1956 # 20d0 <__clone+0xdc>
    1934:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1936:	479d                	li	a5,7
        size_t k = ONES * c;
    1938:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    193c:	08c7f863          	bleu	a2,a5,19cc <memchr+0xca>
    1940:	611c                	ld	a5,0(a0)
    1942:	00000317          	auipc	t1,0x0
    1946:	78630313          	addi	t1,t1,1926 # 20c8 <__clone+0xd4>
    194a:	00033803          	ld	a6,0(t1)
    194e:	00f8c7b3          	xor	a5,a7,a5
    1952:	fff7c713          	not	a4,a5
    1956:	8f95                	sub	a5,a5,a3
    1958:	8ff9                	and	a5,a5,a4
    195a:	0107f7b3          	and	a5,a5,a6
    195e:	e7bd                	bnez	a5,19cc <memchr+0xca>
    1960:	4e1d                	li	t3,7
    1962:	00000e97          	auipc	t4,0x0
    1966:	75ee8e93          	addi	t4,t4,1886 # 20c0 <__clone+0xcc>
    196a:	a005                	j	198a <memchr+0x88>
    196c:	6514                	ld	a3,8(a0)
    196e:	000eb783          	ld	a5,0(t4)
    1972:	00033803          	ld	a6,0(t1)
    1976:	00d8c6b3          	xor	a3,a7,a3
    197a:	97b6                	add	a5,a5,a3
    197c:	fff6c693          	not	a3,a3
    1980:	8ff5                	and	a5,a5,a3
    1982:	0107f7b3          	and	a5,a5,a6
    1986:	e3a1                	bnez	a5,19c6 <memchr+0xc4>
    1988:	853a                	mv	a0,a4
    198a:	1661                	addi	a2,a2,-8
    198c:	00850713          	addi	a4,a0,8
    1990:	fcce6ee3          	bltu	t3,a2,196c <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1994:	c215                	beqz	a2,19b8 <memchr+0xb6>
    1996:	00074783          	lbu	a5,0(a4)
    199a:	00f58d63          	beq	a1,a5,19b4 <memchr+0xb2>
    199e:	00170793          	addi	a5,a4,1
    19a2:	963a                	add	a2,a2,a4
    19a4:	873e                	mv	a4,a5
    19a6:	00f60963          	beq	a2,a5,19b8 <memchr+0xb6>
    19aa:	0007c683          	lbu	a3,0(a5)
    19ae:	0785                	addi	a5,a5,1
    19b0:	feb69ae3          	bne	a3,a1,19a4 <memchr+0xa2>
}
    19b4:	853a                	mv	a0,a4
    19b6:	8082                	ret
    return n ? (void *)s : 0;
    19b8:	4701                	li	a4,0
}
    19ba:	853a                	mv	a0,a4
    19bc:	8082                	ret
    19be:	872a                	mv	a4,a0
    19c0:	00074783          	lbu	a5,0(a4)
    19c4:	bfd9                	j	199a <memchr+0x98>
    19c6:	00854783          	lbu	a5,8(a0)
    19ca:	bfc1                	j	199a <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19cc:	872a                	mv	a4,a0
    19ce:	bfc1                	j	199e <memchr+0x9c>

00000000000019d0 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19d0:	00757793          	andi	a5,a0,7
    19d4:	cfc5                	beqz	a5,1a8c <strnlen+0xbc>
    19d6:	c1c5                	beqz	a1,1a76 <strnlen+0xa6>
    19d8:	00054783          	lbu	a5,0(a0)
    19dc:	cfd9                	beqz	a5,1a7a <strnlen+0xaa>
    19de:	87ae                	mv	a5,a1
    19e0:	86aa                	mv	a3,a0
    19e2:	a029                	j	19ec <strnlen+0x1c>
    19e4:	cbc9                	beqz	a5,1a76 <strnlen+0xa6>
    19e6:	0006c703          	lbu	a4,0(a3)
    19ea:	cb51                	beqz	a4,1a7e <strnlen+0xae>
    19ec:	0685                	addi	a3,a3,1
    19ee:	0076f713          	andi	a4,a3,7
    19f2:	17fd                	addi	a5,a5,-1
    19f4:	fb65                	bnez	a4,19e4 <strnlen+0x14>
    if (n && *s != c)
    19f6:	c3c1                	beqz	a5,1a76 <strnlen+0xa6>
    19f8:	0006c703          	lbu	a4,0(a3)
    19fc:	c349                	beqz	a4,1a7e <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19fe:	471d                	li	a4,7
    1a00:	08f77a63          	bleu	a5,a4,1a94 <strnlen+0xc4>
    1a04:	00000e17          	auipc	t3,0x0
    1a08:	6bce0e13          	addi	t3,t3,1724 # 20c0 <__clone+0xcc>
    1a0c:	6290                	ld	a2,0(a3)
    1a0e:	000e3703          	ld	a4,0(t3)
    1a12:	00000e97          	auipc	t4,0x0
    1a16:	6b6e8e93          	addi	t4,t4,1718 # 20c8 <__clone+0xd4>
    1a1a:	000eb803          	ld	a6,0(t4)
    1a1e:	9732                	add	a4,a4,a2
    1a20:	fff64613          	not	a2,a2
    1a24:	8f71                	and	a4,a4,a2
    1a26:	01077733          	and	a4,a4,a6
    1a2a:	e72d                	bnez	a4,1a94 <strnlen+0xc4>
    1a2c:	4f1d                	li	t5,7
    1a2e:	a839                	j	1a4c <strnlen+0x7c>
    1a30:	6698                	ld	a4,8(a3)
    1a32:	000e3303          	ld	t1,0(t3)
    1a36:	000eb803          	ld	a6,0(t4)
    1a3a:	fff74893          	not	a7,a4
    1a3e:	971a                	add	a4,a4,t1
    1a40:	01177733          	and	a4,a4,a7
    1a44:	01077733          	and	a4,a4,a6
    1a48:	ef1d                	bnez	a4,1a86 <strnlen+0xb6>
    1a4a:	86b2                	mv	a3,a2
    1a4c:	17e1                	addi	a5,a5,-8
    1a4e:	00868613          	addi	a2,a3,8
    1a52:	fcff6fe3          	bltu	t5,a5,1a30 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a56:	c385                	beqz	a5,1a76 <strnlen+0xa6>
    1a58:	00064703          	lbu	a4,0(a2)
    1a5c:	cb19                	beqz	a4,1a72 <strnlen+0xa2>
    1a5e:	00160713          	addi	a4,a2,1
    1a62:	97b2                	add	a5,a5,a2
    1a64:	863a                	mv	a2,a4
    1a66:	00e78863          	beq	a5,a4,1a76 <strnlen+0xa6>
    1a6a:	0705                	addi	a4,a4,1
    1a6c:	fff74683          	lbu	a3,-1(a4)
    1a70:	faf5                	bnez	a3,1a64 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a72:	40a605b3          	sub	a1,a2,a0
}
    1a76:	852e                	mv	a0,a1
    1a78:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a7a:	87ae                	mv	a5,a1
    1a7c:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a7e:	8636                	mv	a2,a3
    1a80:	00064703          	lbu	a4,0(a2)
    1a84:	bfe1                	j	1a5c <strnlen+0x8c>
    1a86:	0086c703          	lbu	a4,8(a3)
    1a8a:	bfc9                	j	1a5c <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a8c:	87ae                	mv	a5,a1
    1a8e:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a90:	f7a5                	bnez	a5,19f8 <strnlen+0x28>
    1a92:	b7d5                	j	1a76 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a94:	8636                	mv	a2,a3
    1a96:	b7e1                	j	1a5e <strnlen+0x8e>

0000000000001a98 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a98:	00b547b3          	xor	a5,a0,a1
    1a9c:	8b9d                	andi	a5,a5,7
    1a9e:	efa9                	bnez	a5,1af8 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1aa0:	0075f793          	andi	a5,a1,7
    1aa4:	c38d                	beqz	a5,1ac6 <strcpy+0x2e>
            if (!(*d = *s))
    1aa6:	0005c783          	lbu	a5,0(a1)
    1aaa:	00f50023          	sb	a5,0(a0)
    1aae:	e799                	bnez	a5,1abc <strcpy+0x24>
    1ab0:	a095                	j	1b14 <strcpy+0x7c>
    1ab2:	0005c783          	lbu	a5,0(a1)
    1ab6:	00f50023          	sb	a5,0(a0)
    1aba:	cbb9                	beqz	a5,1b10 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1abc:	0585                	addi	a1,a1,1
    1abe:	0075f793          	andi	a5,a1,7
    1ac2:	0505                	addi	a0,a0,1
    1ac4:	f7fd                	bnez	a5,1ab2 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1ac6:	00000797          	auipc	a5,0x0
    1aca:	5fa78793          	addi	a5,a5,1530 # 20c0 <__clone+0xcc>
    1ace:	0007b803          	ld	a6,0(a5)
    1ad2:	00000797          	auipc	a5,0x0
    1ad6:	5f678793          	addi	a5,a5,1526 # 20c8 <__clone+0xd4>
    1ada:	6198                	ld	a4,0(a1)
    1adc:	6390                	ld	a2,0(a5)
    1ade:	a031                	j	1aea <strcpy+0x52>
    1ae0:	0521                	addi	a0,a0,8
    1ae2:	05a1                	addi	a1,a1,8
    1ae4:	fee53c23          	sd	a4,-8(a0)
    1ae8:	6198                	ld	a4,0(a1)
    1aea:	010707b3          	add	a5,a4,a6
    1aee:	fff74693          	not	a3,a4
    1af2:	8ff5                	and	a5,a5,a3
    1af4:	8ff1                	and	a5,a5,a2
    1af6:	d7ed                	beqz	a5,1ae0 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1af8:	0005c783          	lbu	a5,0(a1)
    1afc:	00f50023          	sb	a5,0(a0)
    1b00:	cb89                	beqz	a5,1b12 <strcpy+0x7a>
    1b02:	0585                	addi	a1,a1,1
    1b04:	0005c783          	lbu	a5,0(a1)
    1b08:	0505                	addi	a0,a0,1
    1b0a:	00f50023          	sb	a5,0(a0)
    1b0e:	fbf5                	bnez	a5,1b02 <strcpy+0x6a>
        ;
    return d;
}
    1b10:	8082                	ret
    1b12:	8082                	ret
    1b14:	8082                	ret

0000000000001b16 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1b16:	00b547b3          	xor	a5,a0,a1
    1b1a:	8b9d                	andi	a5,a5,7
    1b1c:	ebc1                	bnez	a5,1bac <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1b1e:	0075f793          	andi	a5,a1,7
    1b22:	cf91                	beqz	a5,1b3e <strncpy+0x28>
    1b24:	20060e63          	beqz	a2,1d40 <strncpy+0x22a>
    1b28:	0005c783          	lbu	a5,0(a1)
    1b2c:	00f50023          	sb	a5,0(a0)
    1b30:	c3d5                	beqz	a5,1bd4 <strncpy+0xbe>
    1b32:	0585                	addi	a1,a1,1
    1b34:	0075f793          	andi	a5,a1,7
    1b38:	167d                	addi	a2,a2,-1
    1b3a:	0505                	addi	a0,a0,1
    1b3c:	f7e5                	bnez	a5,1b24 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b3e:	20060163          	beqz	a2,1d40 <strncpy+0x22a>
    1b42:	0005c683          	lbu	a3,0(a1)
    1b46:	c6d9                	beqz	a3,1bd4 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b48:	479d                	li	a5,7
    1b4a:	22c7f563          	bleu	a2,a5,1d74 <strncpy+0x25e>
    1b4e:	00000317          	auipc	t1,0x0
    1b52:	57230313          	addi	t1,t1,1394 # 20c0 <__clone+0xcc>
    1b56:	6198                	ld	a4,0(a1)
    1b58:	00033783          	ld	a5,0(t1)
    1b5c:	00000e17          	auipc	t3,0x0
    1b60:	56ce0e13          	addi	t3,t3,1388 # 20c8 <__clone+0xd4>
    1b64:	000e3803          	ld	a6,0(t3)
    1b68:	97ba                	add	a5,a5,a4
    1b6a:	fff74893          	not	a7,a4
    1b6e:	0117f7b3          	and	a5,a5,a7
    1b72:	0107f7b3          	and	a5,a5,a6
    1b76:	1e079f63          	bnez	a5,1d74 <strncpy+0x25e>
    1b7a:	4e9d                	li	t4,7
    1b7c:	a005                	j	1b9c <strncpy+0x86>
    1b7e:	6598                	ld	a4,8(a1)
    1b80:	00033783          	ld	a5,0(t1)
    1b84:	000e3803          	ld	a6,0(t3)
    1b88:	fff74893          	not	a7,a4
    1b8c:	97ba                	add	a5,a5,a4
    1b8e:	0117f7b3          	and	a5,a5,a7
    1b92:	0107f7b3          	and	a5,a5,a6
    1b96:	1a079f63          	bnez	a5,1d54 <strncpy+0x23e>
    1b9a:	85b6                	mv	a1,a3
            *wd = *ws;
    1b9c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b9e:	1661                	addi	a2,a2,-8
    1ba0:	00858693          	addi	a3,a1,8
    1ba4:	0521                	addi	a0,a0,8
    1ba6:	fcceece3          	bltu	t4,a2,1b7e <strncpy+0x68>
    1baa:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1bac:	18060a63          	beqz	a2,1d40 <strncpy+0x22a>
    1bb0:	0005c783          	lbu	a5,0(a1)
    1bb4:	872a                	mv	a4,a0
    1bb6:	00f50023          	sb	a5,0(a0)
    1bba:	e799                	bnez	a5,1bc8 <strncpy+0xb2>
    1bbc:	a829                	j	1bd6 <strncpy+0xc0>
    1bbe:	0005c783          	lbu	a5,0(a1)
    1bc2:	00f70023          	sb	a5,0(a4)
    1bc6:	cb81                	beqz	a5,1bd6 <strncpy+0xc0>
    1bc8:	167d                	addi	a2,a2,-1
    1bca:	0585                	addi	a1,a1,1
    1bcc:	0705                	addi	a4,a4,1
    1bce:	fa65                	bnez	a2,1bbe <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bd0:	853a                	mv	a0,a4
    1bd2:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bd4:	872a                	mv	a4,a0
    1bd6:	4805                	li	a6,1
    1bd8:	14061c63          	bnez	a2,1d30 <strncpy+0x21a>
    1bdc:	40e007b3          	neg	a5,a4
    1be0:	8b9d                	andi	a5,a5,7
    1be2:	4581                	li	a1,0
    1be4:	12061e63          	bnez	a2,1d20 <strncpy+0x20a>
    1be8:	00778693          	addi	a3,a5,7
    1bec:	452d                	li	a0,11
    1bee:	12a6e763          	bltu	a3,a0,1d1c <strncpy+0x206>
    1bf2:	16d5e663          	bltu	a1,a3,1d5e <strncpy+0x248>
    1bf6:	14078c63          	beqz	a5,1d4e <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bfa:	00070023          	sb	zero,0(a4)
    1bfe:	4585                	li	a1,1
    1c00:	00170693          	addi	a3,a4,1
    1c04:	14b78363          	beq	a5,a1,1d4a <strncpy+0x234>
    1c08:	000700a3          	sb	zero,1(a4)
    1c0c:	4589                	li	a1,2
    1c0e:	00270693          	addi	a3,a4,2
    1c12:	14b78963          	beq	a5,a1,1d64 <strncpy+0x24e>
    1c16:	00070123          	sb	zero,2(a4)
    1c1a:	458d                	li	a1,3
    1c1c:	00370693          	addi	a3,a4,3
    1c20:	12b78363          	beq	a5,a1,1d46 <strncpy+0x230>
    1c24:	000701a3          	sb	zero,3(a4)
    1c28:	4591                	li	a1,4
    1c2a:	00470693          	addi	a3,a4,4
    1c2e:	12b78d63          	beq	a5,a1,1d68 <strncpy+0x252>
    1c32:	00070223          	sb	zero,4(a4)
    1c36:	4595                	li	a1,5
    1c38:	00570693          	addi	a3,a4,5
    1c3c:	12b78863          	beq	a5,a1,1d6c <strncpy+0x256>
    1c40:	000702a3          	sb	zero,5(a4)
    1c44:	459d                	li	a1,7
    1c46:	00670693          	addi	a3,a4,6
    1c4a:	12b79363          	bne	a5,a1,1d70 <strncpy+0x25a>
    1c4e:	00770693          	addi	a3,a4,7
    1c52:	00070323          	sb	zero,6(a4)
    1c56:	40f80833          	sub	a6,a6,a5
    1c5a:	ff887513          	andi	a0,a6,-8
    1c5e:	97ba                	add	a5,a5,a4
    1c60:	953e                	add	a0,a0,a5
    1c62:	0007b023          	sd	zero,0(a5)
    1c66:	07a1                	addi	a5,a5,8
    1c68:	fea79de3          	bne	a5,a0,1c62 <strncpy+0x14c>
    1c6c:	ff887513          	andi	a0,a6,-8
    1c70:	9da9                	addw	a1,a1,a0
    1c72:	00a687b3          	add	a5,a3,a0
    1c76:	f4a80de3          	beq	a6,a0,1bd0 <strncpy+0xba>
    1c7a:	00078023          	sb	zero,0(a5)
    1c7e:	0015869b          	addiw	a3,a1,1
    1c82:	f4c6f7e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1c86:	000780a3          	sb	zero,1(a5)
    1c8a:	0025869b          	addiw	a3,a1,2
    1c8e:	f4c6f1e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1c92:	00078123          	sb	zero,2(a5)
    1c96:	0035869b          	addiw	a3,a1,3
    1c9a:	f2c6fbe3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1c9e:	000781a3          	sb	zero,3(a5)
    1ca2:	0045869b          	addiw	a3,a1,4
    1ca6:	f2c6f5e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1caa:	00078223          	sb	zero,4(a5)
    1cae:	0055869b          	addiw	a3,a1,5
    1cb2:	f0c6ffe3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1cb6:	000782a3          	sb	zero,5(a5)
    1cba:	0065869b          	addiw	a3,a1,6
    1cbe:	f0c6f9e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1cc2:	00078323          	sb	zero,6(a5)
    1cc6:	0075869b          	addiw	a3,a1,7
    1cca:	f0c6f3e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1cce:	000783a3          	sb	zero,7(a5)
    1cd2:	0085869b          	addiw	a3,a1,8
    1cd6:	eec6fde3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1cda:	00078423          	sb	zero,8(a5)
    1cde:	0095869b          	addiw	a3,a1,9
    1ce2:	eec6f7e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1ce6:	000784a3          	sb	zero,9(a5)
    1cea:	00a5869b          	addiw	a3,a1,10
    1cee:	eec6f1e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1cf2:	00078523          	sb	zero,10(a5)
    1cf6:	00b5869b          	addiw	a3,a1,11
    1cfa:	ecc6fbe3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1cfe:	000785a3          	sb	zero,11(a5)
    1d02:	00c5869b          	addiw	a3,a1,12
    1d06:	ecc6f5e3          	bleu	a2,a3,1bd0 <strncpy+0xba>
    1d0a:	00078623          	sb	zero,12(a5)
    1d0e:	25b5                	addiw	a1,a1,13
    1d10:	ecc5f0e3          	bleu	a2,a1,1bd0 <strncpy+0xba>
    1d14:	000786a3          	sb	zero,13(a5)
}
    1d18:	853a                	mv	a0,a4
    1d1a:	8082                	ret
    1d1c:	46ad                	li	a3,11
    1d1e:	bdd1                	j	1bf2 <strncpy+0xdc>
    1d20:	00778693          	addi	a3,a5,7
    1d24:	452d                	li	a0,11
    1d26:	fff60593          	addi	a1,a2,-1
    1d2a:	eca6f4e3          	bleu	a0,a3,1bf2 <strncpy+0xdc>
    1d2e:	b7fd                	j	1d1c <strncpy+0x206>
    1d30:	40e007b3          	neg	a5,a4
    1d34:	8832                	mv	a6,a2
    1d36:	8b9d                	andi	a5,a5,7
    1d38:	4581                	li	a1,0
    1d3a:	ea0607e3          	beqz	a2,1be8 <strncpy+0xd2>
    1d3e:	b7cd                	j	1d20 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d40:	872a                	mv	a4,a0
}
    1d42:	853a                	mv	a0,a4
    1d44:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d46:	458d                	li	a1,3
    1d48:	b739                	j	1c56 <strncpy+0x140>
    1d4a:	4585                	li	a1,1
    1d4c:	b729                	j	1c56 <strncpy+0x140>
    1d4e:	86ba                	mv	a3,a4
    1d50:	4581                	li	a1,0
    1d52:	b711                	j	1c56 <strncpy+0x140>
    1d54:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d58:	872a                	mv	a4,a0
    1d5a:	85b6                	mv	a1,a3
    1d5c:	bda9                	j	1bb6 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d5e:	87ba                	mv	a5,a4
    1d60:	4581                	li	a1,0
    1d62:	bf21                	j	1c7a <strncpy+0x164>
    1d64:	4589                	li	a1,2
    1d66:	bdc5                	j	1c56 <strncpy+0x140>
    1d68:	4591                	li	a1,4
    1d6a:	b5f5                	j	1c56 <strncpy+0x140>
    1d6c:	4595                	li	a1,5
    1d6e:	b5e5                	j	1c56 <strncpy+0x140>
    1d70:	4599                	li	a1,6
    1d72:	b5d5                	j	1c56 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d74:	00d50023          	sb	a3,0(a0)
    1d78:	872a                	mv	a4,a0
    1d7a:	b5b9                	j	1bc8 <strncpy+0xb2>

0000000000001d7c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d7c:	87aa                	mv	a5,a0
    1d7e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d80:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d84:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d88:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d8a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d8c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d90:	2501                	sext.w	a0,a0
    1d92:	8082                	ret

0000000000001d94 <openat>:
    register long a7 __asm__("a7") = n;
    1d94:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d98:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d9c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1da0:	2501                	sext.w	a0,a0
    1da2:	8082                	ret

0000000000001da4 <close>:
    register long a7 __asm__("a7") = n;
    1da4:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1da8:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1dac:	2501                	sext.w	a0,a0
    1dae:	8082                	ret

0000000000001db0 <read>:
    register long a7 __asm__("a7") = n;
    1db0:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1db4:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1db8:	8082                	ret

0000000000001dba <write>:
    register long a7 __asm__("a7") = n;
    1dba:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dbe:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1dc2:	8082                	ret

0000000000001dc4 <getpid>:
    register long a7 __asm__("a7") = n;
    1dc4:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1dc8:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1dcc:	2501                	sext.w	a0,a0
    1dce:	8082                	ret

0000000000001dd0 <getppid>:
    register long a7 __asm__("a7") = n;
    1dd0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dd4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1dd8:	2501                	sext.w	a0,a0
    1dda:	8082                	ret

0000000000001ddc <sched_yield>:
    register long a7 __asm__("a7") = n;
    1ddc:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1de0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1de4:	2501                	sext.w	a0,a0
    1de6:	8082                	ret

0000000000001de8 <fork>:
    register long a7 __asm__("a7") = n;
    1de8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dec:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dee:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1df4:	2501                	sext.w	a0,a0
    1df6:	8082                	ret

0000000000001df8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1df8:	85b2                	mv	a1,a2
    1dfa:	863a                	mv	a2,a4
    if (stack)
    1dfc:	c191                	beqz	a1,1e00 <clone+0x8>
	stack += stack_size;
    1dfe:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1e00:	4781                	li	a5,0
    1e02:	4701                	li	a4,0
    1e04:	4681                	li	a3,0
    1e06:	2601                	sext.w	a2,a2
    1e08:	1ec0006f          	j	1ff4 <__clone>

0000000000001e0c <exit>:
    register long a7 __asm__("a7") = n;
    1e0c:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1e14:	8082                	ret

0000000000001e16 <waitpid>:
    register long a7 __asm__("a7") = n;
    1e16:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1e1a:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e1c:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <exec>:
    register long a7 __asm__("a7") = n;
    1e24:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e28:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e2c:	2501                	sext.w	a0,a0
    1e2e:	8082                	ret

0000000000001e30 <execve>:
    register long a7 __asm__("a7") = n;
    1e30:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e34:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e38:	2501                	sext.w	a0,a0
    1e3a:	8082                	ret

0000000000001e3c <times>:
    register long a7 __asm__("a7") = n;
    1e3c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e40:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <get_time>:

int64 get_time()
{
    1e48:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e4a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e4e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e50:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e52:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e56:	2501                	sext.w	a0,a0
    1e58:	ed09                	bnez	a0,1e72 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e5a:	67a2                	ld	a5,8(sp)
    1e5c:	3e800713          	li	a4,1000
    1e60:	00015503          	lhu	a0,0(sp)
    1e64:	02e7d7b3          	divu	a5,a5,a4
    1e68:	02e50533          	mul	a0,a0,a4
    1e6c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e6e:	0141                	addi	sp,sp,16
    1e70:	8082                	ret
        return -1;
    1e72:	557d                	li	a0,-1
    1e74:	bfed                	j	1e6e <get_time+0x26>

0000000000001e76 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e76:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e7e:	2501                	sext.w	a0,a0
    1e80:	8082                	ret

0000000000001e82 <time>:
    register long a7 __asm__("a7") = n;
    1e82:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e86:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <sleep>:

int sleep(unsigned long long time)
{
    1e8e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e90:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e92:	850a                	mv	a0,sp
    1e94:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e96:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e9a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e9c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ea0:	e501                	bnez	a0,1ea8 <sleep+0x1a>
    return 0;
    1ea2:	4501                	li	a0,0
}
    1ea4:	0141                	addi	sp,sp,16
    1ea6:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1ea8:	4502                	lw	a0,0(sp)
}
    1eaa:	0141                	addi	sp,sp,16
    1eac:	8082                	ret

0000000000001eae <set_priority>:
    register long a7 __asm__("a7") = n;
    1eae:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1eb2:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1eba:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1ebe:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1ec2:	8082                	ret

0000000000001ec4 <munmap>:
    register long a7 __asm__("a7") = n;
    1ec4:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec8:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ecc:	2501                	sext.w	a0,a0
    1ece:	8082                	ret

0000000000001ed0 <wait>:

int wait(int *code)
{
    1ed0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ed2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ed6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ed8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eda:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1edc:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <spawn>:
    register long a7 __asm__("a7") = n;
    1ee4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ee8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <mailread>:
    register long a7 __asm__("a7") = n;
    1ef0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ef4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ef8:	2501                	sext.w	a0,a0
    1efa:	8082                	ret

0000000000001efc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1efc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f00:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <fstat>:
    register long a7 __asm__("a7") = n;
    1f08:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f0c:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1f14:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1f16:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1f1a:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f1c:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1f20:	2501                	sext.w	a0,a0
    1f22:	8082                	ret

0000000000001f24 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f24:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f26:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f2a:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2c:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <link>:

int link(char *old_path, char *new_path)
{
    1f34:	87aa                	mv	a5,a0
    1f36:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f38:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f3c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f40:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f42:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f46:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f48:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f4c:	2501                	sext.w	a0,a0
    1f4e:	8082                	ret

0000000000001f50 <unlink>:

int unlink(char *path)
{
    1f50:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f52:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f56:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f5a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f5c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f60:	2501                	sext.w	a0,a0
    1f62:	8082                	ret

0000000000001f64 <uname>:
    register long a7 __asm__("a7") = n;
    1f64:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f68:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <brk>:
    register long a7 __asm__("a7") = n;
    1f70:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f74:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <getcwd>:
    register long a7 __asm__("a7") = n;
    1f7c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f82:	8082                	ret

0000000000001f84 <chdir>:
    register long a7 __asm__("a7") = n;
    1f84:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f88:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f90:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f92:	02059613          	slli	a2,a1,0x20
    1f96:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f98:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f9c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1fa0:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa2:	00000073          	ecall
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <getdents>:
    register long a7 __asm__("a7") = n;
    1faa:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fae:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <pipe>:
    register long a7 __asm__("a7") = n;
    1fb6:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1fba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fbc:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1fc0:	2501                	sext.w	a0,a0
    1fc2:	8082                	ret

0000000000001fc4 <dup>:
    register long a7 __asm__("a7") = n;
    1fc4:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fc6:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fca:	2501                	sext.w	a0,a0
    1fcc:	8082                	ret

0000000000001fce <dup2>:
    register long a7 __asm__("a7") = n;
    1fce:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fd0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fd2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fd6:	2501                	sext.w	a0,a0
    1fd8:	8082                	ret

0000000000001fda <mount>:
    register long a7 __asm__("a7") = n;
    1fda:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fde:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fe2:	2501                	sext.w	a0,a0
    1fe4:	8082                	ret

0000000000001fe6 <umount>:
    register long a7 __asm__("a7") = n;
    1fe6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fea:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fec:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1ff0:	2501                	sext.w	a0,a0
    1ff2:	8082                	ret

0000000000001ff4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1ff4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1ff6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1ff8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1ffa:	8532                	mv	a0,a2
	mv a2, a4
    1ffc:	863a                	mv	a2,a4
	mv a3, a5
    1ffe:	86be                	mv	a3,a5
	mv a4, a6
    2000:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    2002:	0dc00893          	li	a7,220
	ecall
    2006:	00000073          	ecall

	beqz a0, 1f
    200a:	c111                	beqz	a0,200e <__clone+0x1a>
	# Parent
	ret
    200c:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    200e:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    2010:	6522                	ld	a0,8(sp)
	jalr a1
    2012:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    2014:	05d00893          	li	a7,93
	ecall
    2018:	00000073          	ecall
