
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/close:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0bc0006f          	j	10be <__start_main>

0000000000001006 <test_close>:
 * "  close success."
 * 测试失败则输出：
 * "  close error."
 */

void test_close(void) {
    1006:	1141                	addi	sp,sp,-16
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	ff050513          	addi	a0,a0,-16 # 1ff8 <__clone+0x2a>
void test_close(void) {
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
    TEST_START(__func__);
    1014:	2aa000ef          	jal	ra,12be <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	09050513          	addi	a0,a0,144 # 20a8 <__func__.1212>
    1020:	29e000ef          	jal	ra,12be <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fec50513          	addi	a0,a0,-20 # 2010 <__clone+0x42>
    102c:	292000ef          	jal	ra,12be <puts>
    int fd = open("test_close.txt", O_CREATE | O_RDWR);
    1030:	04200593          	li	a1,66
    1034:	00001517          	auipc	a0,0x1
    1038:	fec50513          	addi	a0,a0,-20 # 2020 <__clone+0x52>
    103c:	51b000ef          	jal	ra,1d56 <open>
    1040:	842a                	mv	s0,a0
    //assert(fd > 0);
    const char *str = "  close error.\n";
    int str_len = strlen(str);
    1042:	00001517          	auipc	a0,0x1
    1046:	fee50513          	addi	a0,a0,-18 # 2030 <__clone+0x62>
    104a:	02f000ef          	jal	ra,1878 <strlen>
    //assert(write(fd, str, str_len) == str_len);
    write(fd, str, str_len);
    104e:	0005061b          	sext.w	a2,a0
    1052:	00001597          	auipc	a1,0x1
    1056:	fde58593          	addi	a1,a1,-34 # 2030 <__clone+0x62>
    105a:	8522                	mv	a0,s0
    105c:	539000ef          	jal	ra,1d94 <write>
    int rt = close(fd);	
    1060:	8522                	mv	a0,s0
    1062:	51d000ef          	jal	ra,1d7e <close>
    assert(rt == 0);
    1066:	ed0d                	bnez	a0,10a0 <test_close+0x9a>
    printf("  close %d success.\n", fd);
    1068:	85a2                	mv	a1,s0
    106a:	00001517          	auipc	a0,0x1
    106e:	ff650513          	addi	a0,a0,-10 # 2060 <__clone+0x92>
    1072:	26e000ef          	jal	ra,12e0 <printf>
	
    TEST_END(__func__);
    1076:	00001517          	auipc	a0,0x1
    107a:	00250513          	addi	a0,a0,2 # 2078 <__clone+0xaa>
    107e:	240000ef          	jal	ra,12be <puts>
    1082:	00001517          	auipc	a0,0x1
    1086:	02650513          	addi	a0,a0,38 # 20a8 <__func__.1212>
    108a:	234000ef          	jal	ra,12be <puts>
}
    108e:	6402                	ld	s0,0(sp)
    1090:	60a2                	ld	ra,8(sp)
    TEST_END(__func__);
    1092:	00001517          	auipc	a0,0x1
    1096:	f7e50513          	addi	a0,a0,-130 # 2010 <__clone+0x42>
}
    109a:	0141                	addi	sp,sp,16
    TEST_END(__func__);
    109c:	2220006f          	j	12be <puts>
    assert(rt == 0);
    10a0:	00001517          	auipc	a0,0x1
    10a4:	fa050513          	addi	a0,a0,-96 # 2040 <__clone+0x72>
    10a8:	4dc000ef          	jal	ra,1584 <panic>
    10ac:	bf75                	j	1068 <test_close+0x62>

00000000000010ae <main>:

int main(void) {
    10ae:	1141                	addi	sp,sp,-16
    10b0:	e406                	sd	ra,8(sp)
    test_close();
    10b2:	f55ff0ef          	jal	ra,1006 <test_close>
    return 0;
}
    10b6:	60a2                	ld	ra,8(sp)
    10b8:	4501                	li	a0,0
    10ba:	0141                	addi	sp,sp,16
    10bc:	8082                	ret

00000000000010be <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10be:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10c0:	4108                	lw	a0,0(a0)
{
    10c2:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c4:	05a1                	addi	a1,a1,8
{
    10c6:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10c8:	fe7ff0ef          	jal	ra,10ae <main>
    10cc:	51b000ef          	jal	ra,1de6 <exit>
	return 0;
}
    10d0:	60a2                	ld	ra,8(sp)
    10d2:	4501                	li	a0,0
    10d4:	0141                	addi	sp,sp,16
    10d6:	8082                	ret

00000000000010d8 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10d8:	7179                	addi	sp,sp,-48
    10da:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10dc:	12054e63          	bltz	a0,1218 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10e0:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10e4:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e6:	02b7f6bb          	remuw	a3,a5,a1
    10ea:	00001717          	auipc	a4,0x1
    10ee:	fce70713          	addi	a4,a4,-50 # 20b8 <digits>
    buf[16] = 0;
    10f2:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f6:	1682                	slli	a3,a3,0x20
    10f8:	9281                	srli	a3,a3,0x20
    10fa:	96ba                	add	a3,a3,a4
    10fc:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1100:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1104:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    1108:	16b7e363          	bltu	a5,a1,126e <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    110c:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1110:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1114:	1602                	slli	a2,a2,0x20
    1116:	9201                	srli	a2,a2,0x20
    1118:	963a                	add	a2,a2,a4
    111a:	00064603          	lbu	a2,0(a2)
    111e:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1122:	0007861b          	sext.w	a2,a5
    1126:	12b6e863          	bltu	a3,a1,1256 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    112a:	02b7f6bb          	remuw	a3,a5,a1
    112e:	1682                	slli	a3,a3,0x20
    1130:	9281                	srli	a3,a3,0x20
    1132:	96ba                	add	a3,a3,a4
    1134:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1138:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    113c:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1140:	10b66e63          	bltu	a2,a1,125c <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1144:	02b876bb          	remuw	a3,a6,a1
    1148:	1682                	slli	a3,a3,0x20
    114a:	9281                	srli	a3,a3,0x20
    114c:	96ba                	add	a3,a3,a4
    114e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1152:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1156:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    115a:	10b86463          	bltu	a6,a1,1262 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    115e:	02b676bb          	remuw	a3,a2,a1
    1162:	1682                	slli	a3,a3,0x20
    1164:	9281                	srli	a3,a3,0x20
    1166:	96ba                	add	a3,a3,a4
    1168:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1170:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1174:	0eb66a63          	bltu	a2,a1,1268 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1178:	02b876bb          	remuw	a3,a6,a1
    117c:	1682                	slli	a3,a3,0x20
    117e:	9281                	srli	a3,a3,0x20
    1180:	96ba                	add	a3,a3,a4
    1182:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1186:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    118a:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    118e:	0cb86163          	bltu	a6,a1,1250 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1192:	02b676bb          	remuw	a3,a2,a1
    1196:	1682                	slli	a3,a3,0x20
    1198:	9281                	srli	a3,a3,0x20
    119a:	96ba                	add	a3,a3,a4
    119c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a0:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11a4:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11a8:	0cb66563          	bltu	a2,a1,1272 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ac:	02b876bb          	remuw	a3,a6,a1
    11b0:	1682                	slli	a3,a3,0x20
    11b2:	9281                	srli	a3,a3,0x20
    11b4:	96ba                	add	a3,a3,a4
    11b6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ba:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11be:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11c2:	0ab86b63          	bltu	a6,a1,1278 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11c6:	02b676bb          	remuw	a3,a2,a1
    11ca:	1682                	slli	a3,a3,0x20
    11cc:	9281                	srli	a3,a3,0x20
    11ce:	96ba                	add	a3,a3,a4
    11d0:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d4:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11d8:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11dc:	0ab66163          	bltu	a2,a1,127e <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11e0:	1782                	slli	a5,a5,0x20
    11e2:	9381                	srli	a5,a5,0x20
    11e4:	97ba                	add	a5,a5,a4
    11e6:	0007c703          	lbu	a4,0(a5)
    11ea:	4599                	li	a1,6
    11ec:	4795                	li	a5,5
    11ee:	00e10723          	sb	a4,14(sp)

    if (sign)
    11f2:	00055963          	bgez	a0,1204 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f6:	1018                	addi	a4,sp,32
    11f8:	973e                	add	a4,a4,a5
    11fa:	02d00693          	li	a3,45
    11fe:	fed70423          	sb	a3,-24(a4)
    1202:	85be                	mv	a1,a5
    write(f, s, l);
    1204:	003c                	addi	a5,sp,8
    1206:	4641                	li	a2,16
    1208:	9e0d                	subw	a2,a2,a1
    120a:	4505                	li	a0,1
    120c:	95be                	add	a1,a1,a5
    120e:	387000ef          	jal	ra,1d94 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1212:	70a2                	ld	ra,40(sp)
    1214:	6145                	addi	sp,sp,48
    1216:	8082                	ret
        x = -xx;
    1218:	40a0063b          	negw	a2,a0
    121c:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    121e:	02b677bb          	remuw	a5,a2,a1
    1222:	00001717          	auipc	a4,0x1
    1226:	e9670713          	addi	a4,a4,-362 # 20b8 <digits>
    buf[16] = 0;
    122a:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    122e:	1782                	slli	a5,a5,0x20
    1230:	9381                	srli	a5,a5,0x20
    1232:	97ba                	add	a5,a5,a4
    1234:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1238:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    123c:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1240:	ecb676e3          	bleu	a1,a2,110c <printint.constprop.0+0x34>
        buf[i--] = '-';
    1244:	02d00793          	li	a5,45
    1248:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124c:	45b9                	li	a1,14
    124e:	bf5d                	j	1204 <printint.constprop.0+0x12c>
    1250:	47a5                	li	a5,9
    1252:	45a9                	li	a1,10
    1254:	bf79                	j	11f2 <printint.constprop.0+0x11a>
    1256:	47b5                	li	a5,13
    1258:	45b9                	li	a1,14
    125a:	bf61                	j	11f2 <printint.constprop.0+0x11a>
    125c:	47b1                	li	a5,12
    125e:	45b5                	li	a1,13
    1260:	bf49                	j	11f2 <printint.constprop.0+0x11a>
    1262:	47ad                	li	a5,11
    1264:	45b1                	li	a1,12
    1266:	b771                	j	11f2 <printint.constprop.0+0x11a>
    1268:	47a9                	li	a5,10
    126a:	45ad                	li	a1,11
    126c:	b759                	j	11f2 <printint.constprop.0+0x11a>
    i = 15;
    126e:	45bd                	li	a1,15
    1270:	bf51                	j	1204 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1272:	47a1                	li	a5,8
    1274:	45a5                	li	a1,9
    1276:	bfb5                	j	11f2 <printint.constprop.0+0x11a>
    1278:	479d                	li	a5,7
    127a:	45a1                	li	a1,8
    127c:	bf9d                	j	11f2 <printint.constprop.0+0x11a>
    127e:	4799                	li	a5,6
    1280:	459d                	li	a1,7
    1282:	bf85                	j	11f2 <printint.constprop.0+0x11a>

0000000000001284 <getchar>:
{
    1284:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1286:	00f10593          	addi	a1,sp,15
    128a:	4605                	li	a2,1
    128c:	4501                	li	a0,0
{
    128e:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1290:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1294:	2f7000ef          	jal	ra,1d8a <read>
}
    1298:	60e2                	ld	ra,24(sp)
    129a:	00f14503          	lbu	a0,15(sp)
    129e:	6105                	addi	sp,sp,32
    12a0:	8082                	ret

00000000000012a2 <putchar>:
{
    12a2:	1101                	addi	sp,sp,-32
    char byte = c;
    12a4:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12a8:	00f10593          	addi	a1,sp,15
    12ac:	4605                	li	a2,1
    12ae:	4505                	li	a0,1
{
    12b0:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12b2:	2e3000ef          	jal	ra,1d94 <write>
}
    12b6:	60e2                	ld	ra,24(sp)
    12b8:	2501                	sext.w	a0,a0
    12ba:	6105                	addi	sp,sp,32
    12bc:	8082                	ret

00000000000012be <puts>:
{
    12be:	1141                	addi	sp,sp,-16
    12c0:	e406                	sd	ra,8(sp)
    12c2:	e022                	sd	s0,0(sp)
    12c4:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c6:	5b2000ef          	jal	ra,1878 <strlen>
    12ca:	862a                	mv	a2,a0
    12cc:	85a2                	mv	a1,s0
    12ce:	4505                	li	a0,1
    12d0:	2c5000ef          	jal	ra,1d94 <write>
}
    12d4:	60a2                	ld	ra,8(sp)
    12d6:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12d8:	957d                	srai	a0,a0,0x3f
    return r;
    12da:	2501                	sext.w	a0,a0
}
    12dc:	0141                	addi	sp,sp,16
    12de:	8082                	ret

00000000000012e0 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e0:	7131                	addi	sp,sp,-192
    12e2:	e0da                	sd	s6,64(sp)
    12e4:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12e6:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12e8:	013c                	addi	a5,sp,136
{
    12ea:	f0ca                	sd	s2,96(sp)
    12ec:	ecce                	sd	s3,88(sp)
    12ee:	e8d2                	sd	s4,80(sp)
    12f0:	e4d6                	sd	s5,72(sp)
    12f2:	fc5e                	sd	s7,56(sp)
    12f4:	fc86                	sd	ra,120(sp)
    12f6:	f8a2                	sd	s0,112(sp)
    12f8:	f4a6                	sd	s1,104(sp)
    12fa:	89aa                	mv	s3,a0
    12fc:	e52e                	sd	a1,136(sp)
    12fe:	e932                	sd	a2,144(sp)
    1300:	ed36                	sd	a3,152(sp)
    1302:	f13a                	sd	a4,160(sp)
    1304:	f942                	sd	a6,176(sp)
    1306:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    1308:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    130a:	02500913          	li	s2,37
    130e:	07000a93          	li	s5,112
    buf[i++] = '0';
    1312:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1316:	00001a17          	auipc	s4,0x1
    131a:	da2a0a13          	addi	s4,s4,-606 # 20b8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    131e:	00001b97          	auipc	s7,0x1
    1322:	d6ab8b93          	addi	s7,s7,-662 # 2088 <__clone+0xba>
        if (!*s)
    1326:	0009c783          	lbu	a5,0(s3)
    132a:	cfb9                	beqz	a5,1388 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    132c:	23278d63          	beq	a5,s2,1566 <printf+0x286>
    1330:	864e                	mv	a2,s3
    1332:	a019                	j	1338 <printf+0x58>
    1334:	07278563          	beq	a5,s2,139e <printf+0xbe>
    1338:	0605                	addi	a2,a2,1
    133a:	00064783          	lbu	a5,0(a2)
    133e:	fbfd                	bnez	a5,1334 <printf+0x54>
    1340:	84b2                	mv	s1,a2
        l = z - a;
    1342:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1346:	8622                	mv	a2,s0
    1348:	85ce                	mv	a1,s3
    134a:	4505                	li	a0,1
    134c:	249000ef          	jal	ra,1d94 <write>
        if (l)
    1350:	ec3d                	bnez	s0,13ce <printf+0xee>
        if (s[1] == 0)
    1352:	0014c783          	lbu	a5,1(s1)
    1356:	cb8d                	beqz	a5,1388 <printf+0xa8>
        switch (s[1])
    1358:	09578b63          	beq	a5,s5,13ee <printf+0x10e>
    135c:	06fafb63          	bleu	a5,s5,13d2 <printf+0xf2>
    1360:	07300713          	li	a4,115
    1364:	1ce78e63          	beq	a5,a4,1540 <printf+0x260>
    1368:	07800713          	li	a4,120
    136c:	1ae79563          	bne	a5,a4,1516 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1370:	6782                	ld	a5,0(sp)
    1372:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1374:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1378:	4388                	lw	a0,0(a5)
    137a:	07a1                	addi	a5,a5,8
    137c:	e03e                	sd	a5,0(sp)
    137e:	d5bff0ef          	jal	ra,10d8 <printint.constprop.0>
        if (!*s)
    1382:	0009c783          	lbu	a5,0(s3)
    1386:	f3dd                	bnez	a5,132c <printf+0x4c>
    }
    va_end(ap);
}
    1388:	70e6                	ld	ra,120(sp)
    138a:	7446                	ld	s0,112(sp)
    138c:	74a6                	ld	s1,104(sp)
    138e:	7906                	ld	s2,96(sp)
    1390:	69e6                	ld	s3,88(sp)
    1392:	6a46                	ld	s4,80(sp)
    1394:	6aa6                	ld	s5,72(sp)
    1396:	6b06                	ld	s6,64(sp)
    1398:	7be2                	ld	s7,56(sp)
    139a:	6129                	addi	sp,sp,192
    139c:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    139e:	00164783          	lbu	a5,1(a2)
    13a2:	84b2                	mv	s1,a2
    13a4:	01278763          	beq	a5,s2,13b2 <printf+0xd2>
    13a8:	bf69                	j	1342 <printf+0x62>
    13aa:	0014c783          	lbu	a5,1(s1)
    13ae:	f9279ae3          	bne	a5,s2,1342 <printf+0x62>
    13b2:	0489                	addi	s1,s1,2
    13b4:	0004c783          	lbu	a5,0(s1)
    13b8:	0605                	addi	a2,a2,1
    13ba:	ff2788e3          	beq	a5,s2,13aa <printf+0xca>
        l = z - a;
    13be:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13c2:	8622                	mv	a2,s0
    13c4:	85ce                	mv	a1,s3
    13c6:	4505                	li	a0,1
    13c8:	1cd000ef          	jal	ra,1d94 <write>
        if (l)
    13cc:	d059                	beqz	s0,1352 <printf+0x72>
    13ce:	89a6                	mv	s3,s1
    13d0:	bf99                	j	1326 <printf+0x46>
    13d2:	06400713          	li	a4,100
    13d6:	14e79063          	bne	a5,a4,1516 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13da:	6782                	ld	a5,0(sp)
    13dc:	45a9                	li	a1,10
        s += 2;
    13de:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13e2:	4388                	lw	a0,0(a5)
    13e4:	07a1                	addi	a5,a5,8
    13e6:	e03e                	sd	a5,0(sp)
    13e8:	cf1ff0ef          	jal	ra,10d8 <printint.constprop.0>
        s += 2;
    13ec:	bf59                	j	1382 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13ee:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f0:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13f4:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f6:	631c                	ld	a5,0(a4)
    13f8:	0721                	addi	a4,a4,8
    13fa:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fc:	00479293          	slli	t0,a5,0x4
    1400:	00879f93          	slli	t6,a5,0x8
    1404:	00c79f13          	slli	t5,a5,0xc
    1408:	01079e93          	slli	t4,a5,0x10
    140c:	01479e13          	slli	t3,a5,0x14
    1410:	01879313          	slli	t1,a5,0x18
    1414:	01c79893          	slli	a7,a5,0x1c
    1418:	02479813          	slli	a6,a5,0x24
    141c:	02879513          	slli	a0,a5,0x28
    1420:	02c79593          	slli	a1,a5,0x2c
    1424:	03079693          	slli	a3,a5,0x30
    1428:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142c:	03c7d413          	srli	s0,a5,0x3c
    1430:	01c7d39b          	srliw	t2,a5,0x1c
    1434:	03c2d293          	srli	t0,t0,0x3c
    1438:	03cfdf93          	srli	t6,t6,0x3c
    143c:	03cf5f13          	srli	t5,t5,0x3c
    1440:	03cede93          	srli	t4,t4,0x3c
    1444:	03ce5e13          	srli	t3,t3,0x3c
    1448:	03c35313          	srli	t1,t1,0x3c
    144c:	03c8d893          	srli	a7,a7,0x3c
    1450:	03c85813          	srli	a6,a6,0x3c
    1454:	9171                	srli	a0,a0,0x3c
    1456:	91f1                	srli	a1,a1,0x3c
    1458:	92f1                	srli	a3,a3,0x3c
    145a:	9371                	srli	a4,a4,0x3c
    145c:	96d2                	add	a3,a3,s4
    145e:	9752                	add	a4,a4,s4
    1460:	9452                	add	s0,s0,s4
    1462:	92d2                	add	t0,t0,s4
    1464:	9fd2                	add	t6,t6,s4
    1466:	9f52                	add	t5,t5,s4
    1468:	9ed2                	add	t4,t4,s4
    146a:	9e52                	add	t3,t3,s4
    146c:	9352                	add	t1,t1,s4
    146e:	98d2                	add	a7,a7,s4
    1470:	93d2                	add	t2,t2,s4
    1472:	9852                	add	a6,a6,s4
    1474:	9552                	add	a0,a0,s4
    1476:	95d2                	add	a1,a1,s4
    1478:	0006c983          	lbu	s3,0(a3)
    147c:	0002c283          	lbu	t0,0(t0)
    1480:	00074683          	lbu	a3,0(a4)
    1484:	000fcf83          	lbu	t6,0(t6)
    1488:	000f4f03          	lbu	t5,0(t5)
    148c:	000ece83          	lbu	t4,0(t4)
    1490:	000e4e03          	lbu	t3,0(t3)
    1494:	00034303          	lbu	t1,0(t1)
    1498:	0008c883          	lbu	a7,0(a7)
    149c:	0003c383          	lbu	t2,0(t2)
    14a0:	00084803          	lbu	a6,0(a6)
    14a4:	00054503          	lbu	a0,0(a0)
    14a8:	0005c583          	lbu	a1,0(a1)
    14ac:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b0:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b4:	9371                	srli	a4,a4,0x3c
    14b6:	8bbd                	andi	a5,a5,15
    14b8:	9752                	add	a4,a4,s4
    14ba:	97d2                	add	a5,a5,s4
    14bc:	005105a3          	sb	t0,11(sp)
    14c0:	01f10623          	sb	t6,12(sp)
    14c4:	01e106a3          	sb	t5,13(sp)
    14c8:	01d10723          	sb	t4,14(sp)
    14cc:	01c107a3          	sb	t3,15(sp)
    14d0:	00610823          	sb	t1,16(sp)
    14d4:	011108a3          	sb	a7,17(sp)
    14d8:	00710923          	sb	t2,18(sp)
    14dc:	010109a3          	sb	a6,19(sp)
    14e0:	00a10a23          	sb	a0,20(sp)
    14e4:	00b10aa3          	sb	a1,21(sp)
    14e8:	01310b23          	sb	s3,22(sp)
    14ec:	00d10ba3          	sb	a3,23(sp)
    14f0:	00810523          	sb	s0,10(sp)
    14f4:	00074703          	lbu	a4,0(a4)
    14f8:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14fc:	002c                	addi	a1,sp,8
    14fe:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1500:	00e10c23          	sb	a4,24(sp)
    1504:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    1508:	00010d23          	sb	zero,26(sp)
        s += 2;
    150c:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1510:	085000ef          	jal	ra,1d94 <write>
        s += 2;
    1514:	b5bd                	j	1382 <printf+0xa2>
    char byte = c;
    1516:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    151a:	4605                	li	a2,1
    151c:	002c                	addi	a1,sp,8
    151e:	4505                	li	a0,1
    char byte = c;
    1520:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1524:	071000ef          	jal	ra,1d94 <write>
    char byte = c;
    1528:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    152c:	4605                	li	a2,1
    152e:	002c                	addi	a1,sp,8
    1530:	4505                	li	a0,1
    char byte = c;
    1532:	00f10423          	sb	a5,8(sp)
        s += 2;
    1536:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    153a:	05b000ef          	jal	ra,1d94 <write>
        s += 2;
    153e:	b591                	j	1382 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1540:	6782                	ld	a5,0(sp)
    1542:	6380                	ld	s0,0(a5)
    1544:	07a1                	addi	a5,a5,8
    1546:	e03e                	sd	a5,0(sp)
    1548:	cc05                	beqz	s0,1580 <printf+0x2a0>
            l = strnlen(a, 200);
    154a:	0c800593          	li	a1,200
    154e:	8522                	mv	a0,s0
    1550:	45a000ef          	jal	ra,19aa <strnlen>
    write(f, s, l);
    1554:	0005061b          	sext.w	a2,a0
    1558:	85a2                	mv	a1,s0
    155a:	4505                	li	a0,1
    155c:	039000ef          	jal	ra,1d94 <write>
        s += 2;
    1560:	00248993          	addi	s3,s1,2
    1564:	bd39                	j	1382 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1566:	0019c783          	lbu	a5,1(s3)
    156a:	84ce                	mv	s1,s3
    156c:	864e                	mv	a2,s3
    156e:	e52782e3          	beq	a5,s2,13b2 <printf+0xd2>
    write(f, s, l);
    1572:	4601                	li	a2,0
    1574:	85ce                	mv	a1,s3
    1576:	4505                	li	a0,1
    1578:	01d000ef          	jal	ra,1d94 <write>
    157c:	84ce                	mv	s1,s3
    157e:	bbd1                	j	1352 <printf+0x72>
                a = "(null)";
    1580:	845e                	mv	s0,s7
    1582:	b7e1                	j	154a <printf+0x26a>

0000000000001584 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1584:	1141                	addi	sp,sp,-16
    1586:	e406                	sd	ra,8(sp)
    puts(m);
    1588:	d37ff0ef          	jal	ra,12be <puts>
    exit(-100);
}
    158c:	60a2                	ld	ra,8(sp)
    exit(-100);
    158e:	f9c00513          	li	a0,-100
}
    1592:	0141                	addi	sp,sp,16
    exit(-100);
    1594:	0530006f          	j	1de6 <exit>

0000000000001598 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1598:	02000793          	li	a5,32
    159c:	00f50663          	beq	a0,a5,15a8 <isspace+0x10>
    15a0:	355d                	addiw	a0,a0,-9
    15a2:	00553513          	sltiu	a0,a0,5
    15a6:	8082                	ret
    15a8:	4505                	li	a0,1
}
    15aa:	8082                	ret

00000000000015ac <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ac:	fd05051b          	addiw	a0,a0,-48
}
    15b0:	00a53513          	sltiu	a0,a0,10
    15b4:	8082                	ret

00000000000015b6 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b6:	02000613          	li	a2,32
    15ba:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15bc:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c0:	0007079b          	sext.w	a5,a4
    15c4:	ff77869b          	addiw	a3,a5,-9
    15c8:	04c70b63          	beq	a4,a2,161e <atoi+0x68>
    15cc:	04d5f963          	bleu	a3,a1,161e <atoi+0x68>
        s++;
    switch (*s)
    15d0:	02b00693          	li	a3,43
    15d4:	04d70a63          	beq	a4,a3,1628 <atoi+0x72>
    15d8:	02d00693          	li	a3,45
    15dc:	06d70463          	beq	a4,a3,1644 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e0:	fd07859b          	addiw	a1,a5,-48
    15e4:	4625                	li	a2,9
    15e6:	873e                	mv	a4,a5
    15e8:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15ea:	4e01                	li	t3,0
    while (isdigit(*s))
    15ec:	04b66a63          	bltu	a2,a1,1640 <atoi+0x8a>
    int n = 0, neg = 0;
    15f0:	4501                	li	a0,0
    while (isdigit(*s))
    15f2:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15f4:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15f6:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15fa:	0025179b          	slliw	a5,a0,0x2
    15fe:	9d3d                	addw	a0,a0,a5
    1600:	fd07031b          	addiw	t1,a4,-48
    1604:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1608:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    160c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1610:	0006071b          	sext.w	a4,a2
    1614:	feb870e3          	bleu	a1,a6,15f4 <atoi+0x3e>
    return neg ? n : -n;
    1618:	000e0563          	beqz	t3,1622 <atoi+0x6c>
}
    161c:	8082                	ret
        s++;
    161e:	0505                	addi	a0,a0,1
    1620:	bf71                	j	15bc <atoi+0x6>
    1622:	4113053b          	subw	a0,t1,a7
    1626:	8082                	ret
    while (isdigit(*s))
    1628:	00154783          	lbu	a5,1(a0)
    162c:	4625                	li	a2,9
        s++;
    162e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1632:	fd07859b          	addiw	a1,a5,-48
    1636:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    163a:	4e01                	li	t3,0
    while (isdigit(*s))
    163c:	fab67ae3          	bleu	a1,a2,15f0 <atoi+0x3a>
    1640:	4501                	li	a0,0
}
    1642:	8082                	ret
    while (isdigit(*s))
    1644:	00154783          	lbu	a5,1(a0)
    1648:	4625                	li	a2,9
        s++;
    164a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    164e:	fd07859b          	addiw	a1,a5,-48
    1652:	0007871b          	sext.w	a4,a5
    1656:	feb665e3          	bltu	a2,a1,1640 <atoi+0x8a>
        neg = 1;
    165a:	4e05                	li	t3,1
    165c:	bf51                	j	15f0 <atoi+0x3a>

000000000000165e <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    165e:	16060d63          	beqz	a2,17d8 <memset+0x17a>
    1662:	40a007b3          	neg	a5,a0
    1666:	8b9d                	andi	a5,a5,7
    1668:	00778713          	addi	a4,a5,7
    166c:	482d                	li	a6,11
    166e:	0ff5f593          	andi	a1,a1,255
    1672:	fff60693          	addi	a3,a2,-1
    1676:	17076263          	bltu	a4,a6,17da <memset+0x17c>
    167a:	16e6ea63          	bltu	a3,a4,17ee <memset+0x190>
    167e:	16078563          	beqz	a5,17e8 <memset+0x18a>
    1682:	00b50023          	sb	a1,0(a0)
    1686:	4705                	li	a4,1
    1688:	00150e93          	addi	t4,a0,1
    168c:	14e78c63          	beq	a5,a4,17e4 <memset+0x186>
    1690:	00b500a3          	sb	a1,1(a0)
    1694:	4709                	li	a4,2
    1696:	00250e93          	addi	t4,a0,2
    169a:	14e78d63          	beq	a5,a4,17f4 <memset+0x196>
    169e:	00b50123          	sb	a1,2(a0)
    16a2:	470d                	li	a4,3
    16a4:	00350e93          	addi	t4,a0,3
    16a8:	12e78b63          	beq	a5,a4,17de <memset+0x180>
    16ac:	00b501a3          	sb	a1,3(a0)
    16b0:	4711                	li	a4,4
    16b2:	00450e93          	addi	t4,a0,4
    16b6:	14e78163          	beq	a5,a4,17f8 <memset+0x19a>
    16ba:	00b50223          	sb	a1,4(a0)
    16be:	4715                	li	a4,5
    16c0:	00550e93          	addi	t4,a0,5
    16c4:	12e78c63          	beq	a5,a4,17fc <memset+0x19e>
    16c8:	00b502a3          	sb	a1,5(a0)
    16cc:	471d                	li	a4,7
    16ce:	00650e93          	addi	t4,a0,6
    16d2:	12e79763          	bne	a5,a4,1800 <memset+0x1a2>
    16d6:	00750e93          	addi	t4,a0,7
    16da:	00b50323          	sb	a1,6(a0)
    16de:	4f1d                	li	t5,7
    16e0:	00859713          	slli	a4,a1,0x8
    16e4:	8f4d                	or	a4,a4,a1
    16e6:	01059e13          	slli	t3,a1,0x10
    16ea:	01c76e33          	or	t3,a4,t3
    16ee:	01859313          	slli	t1,a1,0x18
    16f2:	006e6333          	or	t1,t3,t1
    16f6:	02059893          	slli	a7,a1,0x20
    16fa:	011368b3          	or	a7,t1,a7
    16fe:	02859813          	slli	a6,a1,0x28
    1702:	40f60333          	sub	t1,a2,a5
    1706:	0108e833          	or	a6,a7,a6
    170a:	03059693          	slli	a3,a1,0x30
    170e:	00d866b3          	or	a3,a6,a3
    1712:	03859713          	slli	a4,a1,0x38
    1716:	97aa                	add	a5,a5,a0
    1718:	ff837813          	andi	a6,t1,-8
    171c:	8f55                	or	a4,a4,a3
    171e:	00f806b3          	add	a3,a6,a5
    1722:	e398                	sd	a4,0(a5)
    1724:	07a1                	addi	a5,a5,8
    1726:	fed79ee3          	bne	a5,a3,1722 <memset+0xc4>
    172a:	ff837693          	andi	a3,t1,-8
    172e:	00de87b3          	add	a5,t4,a3
    1732:	01e6873b          	addw	a4,a3,t5
    1736:	0ad30663          	beq	t1,a3,17e2 <memset+0x184>
    173a:	00b78023          	sb	a1,0(a5)
    173e:	0017069b          	addiw	a3,a4,1
    1742:	08c6fb63          	bleu	a2,a3,17d8 <memset+0x17a>
    1746:	00b780a3          	sb	a1,1(a5)
    174a:	0027069b          	addiw	a3,a4,2
    174e:	08c6f563          	bleu	a2,a3,17d8 <memset+0x17a>
    1752:	00b78123          	sb	a1,2(a5)
    1756:	0037069b          	addiw	a3,a4,3
    175a:	06c6ff63          	bleu	a2,a3,17d8 <memset+0x17a>
    175e:	00b781a3          	sb	a1,3(a5)
    1762:	0047069b          	addiw	a3,a4,4
    1766:	06c6f963          	bleu	a2,a3,17d8 <memset+0x17a>
    176a:	00b78223          	sb	a1,4(a5)
    176e:	0057069b          	addiw	a3,a4,5
    1772:	06c6f363          	bleu	a2,a3,17d8 <memset+0x17a>
    1776:	00b782a3          	sb	a1,5(a5)
    177a:	0067069b          	addiw	a3,a4,6
    177e:	04c6fd63          	bleu	a2,a3,17d8 <memset+0x17a>
    1782:	00b78323          	sb	a1,6(a5)
    1786:	0077069b          	addiw	a3,a4,7
    178a:	04c6f763          	bleu	a2,a3,17d8 <memset+0x17a>
    178e:	00b783a3          	sb	a1,7(a5)
    1792:	0087069b          	addiw	a3,a4,8
    1796:	04c6f163          	bleu	a2,a3,17d8 <memset+0x17a>
    179a:	00b78423          	sb	a1,8(a5)
    179e:	0097069b          	addiw	a3,a4,9
    17a2:	02c6fb63          	bleu	a2,a3,17d8 <memset+0x17a>
    17a6:	00b784a3          	sb	a1,9(a5)
    17aa:	00a7069b          	addiw	a3,a4,10
    17ae:	02c6f563          	bleu	a2,a3,17d8 <memset+0x17a>
    17b2:	00b78523          	sb	a1,10(a5)
    17b6:	00b7069b          	addiw	a3,a4,11
    17ba:	00c6ff63          	bleu	a2,a3,17d8 <memset+0x17a>
    17be:	00b785a3          	sb	a1,11(a5)
    17c2:	00c7069b          	addiw	a3,a4,12
    17c6:	00c6f963          	bleu	a2,a3,17d8 <memset+0x17a>
    17ca:	00b78623          	sb	a1,12(a5)
    17ce:	2735                	addiw	a4,a4,13
    17d0:	00c77463          	bleu	a2,a4,17d8 <memset+0x17a>
    17d4:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17d8:	8082                	ret
    17da:	472d                	li	a4,11
    17dc:	bd79                	j	167a <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17de:	4f0d                	li	t5,3
    17e0:	b701                	j	16e0 <memset+0x82>
    17e2:	8082                	ret
    17e4:	4f05                	li	t5,1
    17e6:	bded                	j	16e0 <memset+0x82>
    17e8:	8eaa                	mv	t4,a0
    17ea:	4f01                	li	t5,0
    17ec:	bdd5                	j	16e0 <memset+0x82>
    17ee:	87aa                	mv	a5,a0
    17f0:	4701                	li	a4,0
    17f2:	b7a1                	j	173a <memset+0xdc>
    17f4:	4f09                	li	t5,2
    17f6:	b5ed                	j	16e0 <memset+0x82>
    17f8:	4f11                	li	t5,4
    17fa:	b5dd                	j	16e0 <memset+0x82>
    17fc:	4f15                	li	t5,5
    17fe:	b5cd                	j	16e0 <memset+0x82>
    1800:	4f19                	li	t5,6
    1802:	bdf9                	j	16e0 <memset+0x82>

0000000000001804 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1804:	00054703          	lbu	a4,0(a0)
    1808:	0005c783          	lbu	a5,0(a1)
    180c:	00e79b63          	bne	a5,a4,1822 <strcmp+0x1e>
    1810:	cf89                	beqz	a5,182a <strcmp+0x26>
    1812:	0505                	addi	a0,a0,1
    1814:	0585                	addi	a1,a1,1
    1816:	0005c783          	lbu	a5,0(a1)
    181a:	00054703          	lbu	a4,0(a0)
    181e:	fef709e3          	beq	a4,a5,1810 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1822:	0007051b          	sext.w	a0,a4
}
    1826:	9d1d                	subw	a0,a0,a5
    1828:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    182a:	4501                	li	a0,0
}
    182c:	9d1d                	subw	a0,a0,a5
    182e:	8082                	ret

0000000000001830 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1830:	c231                	beqz	a2,1874 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1832:	00054783          	lbu	a5,0(a0)
    1836:	0005c683          	lbu	a3,0(a1)
    183a:	c795                	beqz	a5,1866 <strncmp+0x36>
    183c:	ca85                	beqz	a3,186c <strncmp+0x3c>
    if (!n--)
    183e:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1840:	c615                	beqz	a2,186c <strncmp+0x3c>
    1842:	00150713          	addi	a4,a0,1
    1846:	9532                	add	a0,a0,a2
    1848:	00d78963          	beq	a5,a3,185a <strncmp+0x2a>
    184c:	a005                	j	186c <strncmp+0x3c>
    184e:	ce99                	beqz	a3,186c <strncmp+0x3c>
    1850:	00e50e63          	beq	a0,a4,186c <strncmp+0x3c>
    1854:	0705                	addi	a4,a4,1
    1856:	00d79b63          	bne	a5,a3,186c <strncmp+0x3c>
    185a:	00074783          	lbu	a5,0(a4)
    185e:	0585                	addi	a1,a1,1
    1860:	0005c683          	lbu	a3,0(a1)
    1864:	f7ed                	bnez	a5,184e <strncmp+0x1e>
    1866:	4501                	li	a0,0
        ;
    return *l - *r;
    1868:	9d15                	subw	a0,a0,a3
    186a:	8082                	ret
    186c:	0007851b          	sext.w	a0,a5
    1870:	9d15                	subw	a0,a0,a3
    1872:	8082                	ret
        return 0;
    1874:	4501                	li	a0,0
}
    1876:	8082                	ret

0000000000001878 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1878:	00757793          	andi	a5,a0,7
    187c:	cfa1                	beqz	a5,18d4 <strlen+0x5c>
        if (!*s)
    187e:	00054783          	lbu	a5,0(a0)
    1882:	cbb9                	beqz	a5,18d8 <strlen+0x60>
    1884:	87aa                	mv	a5,a0
    1886:	a021                	j	188e <strlen+0x16>
    1888:	0007c703          	lbu	a4,0(a5)
    188c:	c329                	beqz	a4,18ce <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    188e:	0785                	addi	a5,a5,1
    1890:	0077f713          	andi	a4,a5,7
    1894:	fb75                	bnez	a4,1888 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1896:	00000717          	auipc	a4,0x0
    189a:	7fa70713          	addi	a4,a4,2042 # 2090 <__clone+0xc2>
    189e:	630c                	ld	a1,0(a4)
    18a0:	00000717          	auipc	a4,0x0
    18a4:	7f870713          	addi	a4,a4,2040 # 2098 <__clone+0xca>
    18a8:	6394                	ld	a3,0(a5)
    18aa:	6310                	ld	a2,0(a4)
    18ac:	a019                	j	18b2 <strlen+0x3a>
    18ae:	07a1                	addi	a5,a5,8
    18b0:	6394                	ld	a3,0(a5)
    18b2:	00b68733          	add	a4,a3,a1
    18b6:	fff6c693          	not	a3,a3
    18ba:	8f75                	and	a4,a4,a3
    18bc:	8f71                	and	a4,a4,a2
    18be:	db65                	beqz	a4,18ae <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18c0:	0007c703          	lbu	a4,0(a5)
    18c4:	c709                	beqz	a4,18ce <strlen+0x56>
    18c6:	0785                	addi	a5,a5,1
    18c8:	0007c703          	lbu	a4,0(a5)
    18cc:	ff6d                	bnez	a4,18c6 <strlen+0x4e>
        ;
    return s - a;
    18ce:	40a78533          	sub	a0,a5,a0
}
    18d2:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18d4:	87aa                	mv	a5,a0
    18d6:	b7c1                	j	1896 <strlen+0x1e>
        if (!*s)
    18d8:	4501                	li	a0,0
            return s - a;
    18da:	8082                	ret

00000000000018dc <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18dc:	00757793          	andi	a5,a0,7
    18e0:	0ff5f593          	andi	a1,a1,255
    18e4:	cb99                	beqz	a5,18fa <memchr+0x1e>
    18e6:	c655                	beqz	a2,1992 <memchr+0xb6>
    18e8:	00054783          	lbu	a5,0(a0)
    18ec:	0ab78663          	beq	a5,a1,1998 <memchr+0xbc>
    18f0:	0505                	addi	a0,a0,1
    18f2:	00757793          	andi	a5,a0,7
    18f6:	167d                	addi	a2,a2,-1
    18f8:	f7fd                	bnez	a5,18e6 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fa:	4701                	li	a4,0
    if (n && *s != c)
    18fc:	ca49                	beqz	a2,198e <memchr+0xb2>
    18fe:	00054783          	lbu	a5,0(a0)
    1902:	08b78b63          	beq	a5,a1,1998 <memchr+0xbc>
        size_t k = ONES * c;
    1906:	00000797          	auipc	a5,0x0
    190a:	79a78793          	addi	a5,a5,1946 # 20a0 <__clone+0xd2>
    190e:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1910:	479d                	li	a5,7
        size_t k = ONES * c;
    1912:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1916:	08c7f863          	bleu	a2,a5,19a6 <memchr+0xca>
    191a:	611c                	ld	a5,0(a0)
    191c:	00000317          	auipc	t1,0x0
    1920:	77c30313          	addi	t1,t1,1916 # 2098 <__clone+0xca>
    1924:	00033803          	ld	a6,0(t1)
    1928:	00f8c7b3          	xor	a5,a7,a5
    192c:	fff7c713          	not	a4,a5
    1930:	8f95                	sub	a5,a5,a3
    1932:	8ff9                	and	a5,a5,a4
    1934:	0107f7b3          	and	a5,a5,a6
    1938:	e7bd                	bnez	a5,19a6 <memchr+0xca>
    193a:	4e1d                	li	t3,7
    193c:	00000e97          	auipc	t4,0x0
    1940:	754e8e93          	addi	t4,t4,1876 # 2090 <__clone+0xc2>
    1944:	a005                	j	1964 <memchr+0x88>
    1946:	6514                	ld	a3,8(a0)
    1948:	000eb783          	ld	a5,0(t4)
    194c:	00033803          	ld	a6,0(t1)
    1950:	00d8c6b3          	xor	a3,a7,a3
    1954:	97b6                	add	a5,a5,a3
    1956:	fff6c693          	not	a3,a3
    195a:	8ff5                	and	a5,a5,a3
    195c:	0107f7b3          	and	a5,a5,a6
    1960:	e3a1                	bnez	a5,19a0 <memchr+0xc4>
    1962:	853a                	mv	a0,a4
    1964:	1661                	addi	a2,a2,-8
    1966:	00850713          	addi	a4,a0,8
    196a:	fcce6ee3          	bltu	t3,a2,1946 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    196e:	c215                	beqz	a2,1992 <memchr+0xb6>
    1970:	00074783          	lbu	a5,0(a4)
    1974:	00f58d63          	beq	a1,a5,198e <memchr+0xb2>
    1978:	00170793          	addi	a5,a4,1
    197c:	963a                	add	a2,a2,a4
    197e:	873e                	mv	a4,a5
    1980:	00f60963          	beq	a2,a5,1992 <memchr+0xb6>
    1984:	0007c683          	lbu	a3,0(a5)
    1988:	0785                	addi	a5,a5,1
    198a:	feb69ae3          	bne	a3,a1,197e <memchr+0xa2>
}
    198e:	853a                	mv	a0,a4
    1990:	8082                	ret
    return n ? (void *)s : 0;
    1992:	4701                	li	a4,0
}
    1994:	853a                	mv	a0,a4
    1996:	8082                	ret
    1998:	872a                	mv	a4,a0
    199a:	00074783          	lbu	a5,0(a4)
    199e:	bfd9                	j	1974 <memchr+0x98>
    19a0:	00854783          	lbu	a5,8(a0)
    19a4:	bfc1                	j	1974 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a6:	872a                	mv	a4,a0
    19a8:	bfc1                	j	1978 <memchr+0x9c>

00000000000019aa <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19aa:	00757793          	andi	a5,a0,7
    19ae:	cfc5                	beqz	a5,1a66 <strnlen+0xbc>
    19b0:	c1c5                	beqz	a1,1a50 <strnlen+0xa6>
    19b2:	00054783          	lbu	a5,0(a0)
    19b6:	cfd9                	beqz	a5,1a54 <strnlen+0xaa>
    19b8:	87ae                	mv	a5,a1
    19ba:	86aa                	mv	a3,a0
    19bc:	a029                	j	19c6 <strnlen+0x1c>
    19be:	cbc9                	beqz	a5,1a50 <strnlen+0xa6>
    19c0:	0006c703          	lbu	a4,0(a3)
    19c4:	cb51                	beqz	a4,1a58 <strnlen+0xae>
    19c6:	0685                	addi	a3,a3,1
    19c8:	0076f713          	andi	a4,a3,7
    19cc:	17fd                	addi	a5,a5,-1
    19ce:	fb65                	bnez	a4,19be <strnlen+0x14>
    if (n && *s != c)
    19d0:	c3c1                	beqz	a5,1a50 <strnlen+0xa6>
    19d2:	0006c703          	lbu	a4,0(a3)
    19d6:	c349                	beqz	a4,1a58 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19d8:	471d                	li	a4,7
    19da:	08f77a63          	bleu	a5,a4,1a6e <strnlen+0xc4>
    19de:	00000e17          	auipc	t3,0x0
    19e2:	6b2e0e13          	addi	t3,t3,1714 # 2090 <__clone+0xc2>
    19e6:	6290                	ld	a2,0(a3)
    19e8:	000e3703          	ld	a4,0(t3)
    19ec:	00000e97          	auipc	t4,0x0
    19f0:	6ace8e93          	addi	t4,t4,1708 # 2098 <__clone+0xca>
    19f4:	000eb803          	ld	a6,0(t4)
    19f8:	9732                	add	a4,a4,a2
    19fa:	fff64613          	not	a2,a2
    19fe:	8f71                	and	a4,a4,a2
    1a00:	01077733          	and	a4,a4,a6
    1a04:	e72d                	bnez	a4,1a6e <strnlen+0xc4>
    1a06:	4f1d                	li	t5,7
    1a08:	a839                	j	1a26 <strnlen+0x7c>
    1a0a:	6698                	ld	a4,8(a3)
    1a0c:	000e3303          	ld	t1,0(t3)
    1a10:	000eb803          	ld	a6,0(t4)
    1a14:	fff74893          	not	a7,a4
    1a18:	971a                	add	a4,a4,t1
    1a1a:	01177733          	and	a4,a4,a7
    1a1e:	01077733          	and	a4,a4,a6
    1a22:	ef1d                	bnez	a4,1a60 <strnlen+0xb6>
    1a24:	86b2                	mv	a3,a2
    1a26:	17e1                	addi	a5,a5,-8
    1a28:	00868613          	addi	a2,a3,8
    1a2c:	fcff6fe3          	bltu	t5,a5,1a0a <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a30:	c385                	beqz	a5,1a50 <strnlen+0xa6>
    1a32:	00064703          	lbu	a4,0(a2)
    1a36:	cb19                	beqz	a4,1a4c <strnlen+0xa2>
    1a38:	00160713          	addi	a4,a2,1
    1a3c:	97b2                	add	a5,a5,a2
    1a3e:	863a                	mv	a2,a4
    1a40:	00e78863          	beq	a5,a4,1a50 <strnlen+0xa6>
    1a44:	0705                	addi	a4,a4,1
    1a46:	fff74683          	lbu	a3,-1(a4)
    1a4a:	faf5                	bnez	a3,1a3e <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a4c:	40a605b3          	sub	a1,a2,a0
}
    1a50:	852e                	mv	a0,a1
    1a52:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a54:	87ae                	mv	a5,a1
    1a56:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a58:	8636                	mv	a2,a3
    1a5a:	00064703          	lbu	a4,0(a2)
    1a5e:	bfe1                	j	1a36 <strnlen+0x8c>
    1a60:	0086c703          	lbu	a4,8(a3)
    1a64:	bfc9                	j	1a36 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a66:	87ae                	mv	a5,a1
    1a68:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a6a:	f7a5                	bnez	a5,19d2 <strnlen+0x28>
    1a6c:	b7d5                	j	1a50 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a6e:	8636                	mv	a2,a3
    1a70:	b7e1                	j	1a38 <strnlen+0x8e>

0000000000001a72 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a72:	00b547b3          	xor	a5,a0,a1
    1a76:	8b9d                	andi	a5,a5,7
    1a78:	efa9                	bnez	a5,1ad2 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a7a:	0075f793          	andi	a5,a1,7
    1a7e:	c38d                	beqz	a5,1aa0 <strcpy+0x2e>
            if (!(*d = *s))
    1a80:	0005c783          	lbu	a5,0(a1)
    1a84:	00f50023          	sb	a5,0(a0)
    1a88:	e799                	bnez	a5,1a96 <strcpy+0x24>
    1a8a:	a095                	j	1aee <strcpy+0x7c>
    1a8c:	0005c783          	lbu	a5,0(a1)
    1a90:	00f50023          	sb	a5,0(a0)
    1a94:	cbb9                	beqz	a5,1aea <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a96:	0585                	addi	a1,a1,1
    1a98:	0075f793          	andi	a5,a1,7
    1a9c:	0505                	addi	a0,a0,1
    1a9e:	f7fd                	bnez	a5,1a8c <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aa0:	00000797          	auipc	a5,0x0
    1aa4:	5f078793          	addi	a5,a5,1520 # 2090 <__clone+0xc2>
    1aa8:	0007b803          	ld	a6,0(a5)
    1aac:	00000797          	auipc	a5,0x0
    1ab0:	5ec78793          	addi	a5,a5,1516 # 2098 <__clone+0xca>
    1ab4:	6198                	ld	a4,0(a1)
    1ab6:	6390                	ld	a2,0(a5)
    1ab8:	a031                	j	1ac4 <strcpy+0x52>
    1aba:	0521                	addi	a0,a0,8
    1abc:	05a1                	addi	a1,a1,8
    1abe:	fee53c23          	sd	a4,-8(a0)
    1ac2:	6198                	ld	a4,0(a1)
    1ac4:	010707b3          	add	a5,a4,a6
    1ac8:	fff74693          	not	a3,a4
    1acc:	8ff5                	and	a5,a5,a3
    1ace:	8ff1                	and	a5,a5,a2
    1ad0:	d7ed                	beqz	a5,1aba <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ad2:	0005c783          	lbu	a5,0(a1)
    1ad6:	00f50023          	sb	a5,0(a0)
    1ada:	cb89                	beqz	a5,1aec <strcpy+0x7a>
    1adc:	0585                	addi	a1,a1,1
    1ade:	0005c783          	lbu	a5,0(a1)
    1ae2:	0505                	addi	a0,a0,1
    1ae4:	00f50023          	sb	a5,0(a0)
    1ae8:	fbf5                	bnez	a5,1adc <strcpy+0x6a>
        ;
    return d;
}
    1aea:	8082                	ret
    1aec:	8082                	ret
    1aee:	8082                	ret

0000000000001af0 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1af0:	00b547b3          	xor	a5,a0,a1
    1af4:	8b9d                	andi	a5,a5,7
    1af6:	ebc1                	bnez	a5,1b86 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1af8:	0075f793          	andi	a5,a1,7
    1afc:	cf91                	beqz	a5,1b18 <strncpy+0x28>
    1afe:	20060e63          	beqz	a2,1d1a <strncpy+0x22a>
    1b02:	0005c783          	lbu	a5,0(a1)
    1b06:	00f50023          	sb	a5,0(a0)
    1b0a:	c3d5                	beqz	a5,1bae <strncpy+0xbe>
    1b0c:	0585                	addi	a1,a1,1
    1b0e:	0075f793          	andi	a5,a1,7
    1b12:	167d                	addi	a2,a2,-1
    1b14:	0505                	addi	a0,a0,1
    1b16:	f7e5                	bnez	a5,1afe <strncpy+0xe>
            ;
        if (!n || !*s)
    1b18:	20060163          	beqz	a2,1d1a <strncpy+0x22a>
    1b1c:	0005c683          	lbu	a3,0(a1)
    1b20:	c6d9                	beqz	a3,1bae <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b22:	479d                	li	a5,7
    1b24:	22c7f563          	bleu	a2,a5,1d4e <strncpy+0x25e>
    1b28:	00000317          	auipc	t1,0x0
    1b2c:	56830313          	addi	t1,t1,1384 # 2090 <__clone+0xc2>
    1b30:	6198                	ld	a4,0(a1)
    1b32:	00033783          	ld	a5,0(t1)
    1b36:	00000e17          	auipc	t3,0x0
    1b3a:	562e0e13          	addi	t3,t3,1378 # 2098 <__clone+0xca>
    1b3e:	000e3803          	ld	a6,0(t3)
    1b42:	97ba                	add	a5,a5,a4
    1b44:	fff74893          	not	a7,a4
    1b48:	0117f7b3          	and	a5,a5,a7
    1b4c:	0107f7b3          	and	a5,a5,a6
    1b50:	1e079f63          	bnez	a5,1d4e <strncpy+0x25e>
    1b54:	4e9d                	li	t4,7
    1b56:	a005                	j	1b76 <strncpy+0x86>
    1b58:	6598                	ld	a4,8(a1)
    1b5a:	00033783          	ld	a5,0(t1)
    1b5e:	000e3803          	ld	a6,0(t3)
    1b62:	fff74893          	not	a7,a4
    1b66:	97ba                	add	a5,a5,a4
    1b68:	0117f7b3          	and	a5,a5,a7
    1b6c:	0107f7b3          	and	a5,a5,a6
    1b70:	1a079f63          	bnez	a5,1d2e <strncpy+0x23e>
    1b74:	85b6                	mv	a1,a3
            *wd = *ws;
    1b76:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b78:	1661                	addi	a2,a2,-8
    1b7a:	00858693          	addi	a3,a1,8
    1b7e:	0521                	addi	a0,a0,8
    1b80:	fcceece3          	bltu	t4,a2,1b58 <strncpy+0x68>
    1b84:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b86:	18060a63          	beqz	a2,1d1a <strncpy+0x22a>
    1b8a:	0005c783          	lbu	a5,0(a1)
    1b8e:	872a                	mv	a4,a0
    1b90:	00f50023          	sb	a5,0(a0)
    1b94:	e799                	bnez	a5,1ba2 <strncpy+0xb2>
    1b96:	a829                	j	1bb0 <strncpy+0xc0>
    1b98:	0005c783          	lbu	a5,0(a1)
    1b9c:	00f70023          	sb	a5,0(a4)
    1ba0:	cb81                	beqz	a5,1bb0 <strncpy+0xc0>
    1ba2:	167d                	addi	a2,a2,-1
    1ba4:	0585                	addi	a1,a1,1
    1ba6:	0705                	addi	a4,a4,1
    1ba8:	fa65                	bnez	a2,1b98 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1baa:	853a                	mv	a0,a4
    1bac:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bae:	872a                	mv	a4,a0
    1bb0:	4805                	li	a6,1
    1bb2:	14061c63          	bnez	a2,1d0a <strncpy+0x21a>
    1bb6:	40e007b3          	neg	a5,a4
    1bba:	8b9d                	andi	a5,a5,7
    1bbc:	4581                	li	a1,0
    1bbe:	12061e63          	bnez	a2,1cfa <strncpy+0x20a>
    1bc2:	00778693          	addi	a3,a5,7
    1bc6:	452d                	li	a0,11
    1bc8:	12a6e763          	bltu	a3,a0,1cf6 <strncpy+0x206>
    1bcc:	16d5e663          	bltu	a1,a3,1d38 <strncpy+0x248>
    1bd0:	14078c63          	beqz	a5,1d28 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd4:	00070023          	sb	zero,0(a4)
    1bd8:	4585                	li	a1,1
    1bda:	00170693          	addi	a3,a4,1
    1bde:	14b78363          	beq	a5,a1,1d24 <strncpy+0x234>
    1be2:	000700a3          	sb	zero,1(a4)
    1be6:	4589                	li	a1,2
    1be8:	00270693          	addi	a3,a4,2
    1bec:	14b78963          	beq	a5,a1,1d3e <strncpy+0x24e>
    1bf0:	00070123          	sb	zero,2(a4)
    1bf4:	458d                	li	a1,3
    1bf6:	00370693          	addi	a3,a4,3
    1bfa:	12b78363          	beq	a5,a1,1d20 <strncpy+0x230>
    1bfe:	000701a3          	sb	zero,3(a4)
    1c02:	4591                	li	a1,4
    1c04:	00470693          	addi	a3,a4,4
    1c08:	12b78d63          	beq	a5,a1,1d42 <strncpy+0x252>
    1c0c:	00070223          	sb	zero,4(a4)
    1c10:	4595                	li	a1,5
    1c12:	00570693          	addi	a3,a4,5
    1c16:	12b78863          	beq	a5,a1,1d46 <strncpy+0x256>
    1c1a:	000702a3          	sb	zero,5(a4)
    1c1e:	459d                	li	a1,7
    1c20:	00670693          	addi	a3,a4,6
    1c24:	12b79363          	bne	a5,a1,1d4a <strncpy+0x25a>
    1c28:	00770693          	addi	a3,a4,7
    1c2c:	00070323          	sb	zero,6(a4)
    1c30:	40f80833          	sub	a6,a6,a5
    1c34:	ff887513          	andi	a0,a6,-8
    1c38:	97ba                	add	a5,a5,a4
    1c3a:	953e                	add	a0,a0,a5
    1c3c:	0007b023          	sd	zero,0(a5)
    1c40:	07a1                	addi	a5,a5,8
    1c42:	fea79de3          	bne	a5,a0,1c3c <strncpy+0x14c>
    1c46:	ff887513          	andi	a0,a6,-8
    1c4a:	9da9                	addw	a1,a1,a0
    1c4c:	00a687b3          	add	a5,a3,a0
    1c50:	f4a80de3          	beq	a6,a0,1baa <strncpy+0xba>
    1c54:	00078023          	sb	zero,0(a5)
    1c58:	0015869b          	addiw	a3,a1,1
    1c5c:	f4c6f7e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1c60:	000780a3          	sb	zero,1(a5)
    1c64:	0025869b          	addiw	a3,a1,2
    1c68:	f4c6f1e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1c6c:	00078123          	sb	zero,2(a5)
    1c70:	0035869b          	addiw	a3,a1,3
    1c74:	f2c6fbe3          	bleu	a2,a3,1baa <strncpy+0xba>
    1c78:	000781a3          	sb	zero,3(a5)
    1c7c:	0045869b          	addiw	a3,a1,4
    1c80:	f2c6f5e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1c84:	00078223          	sb	zero,4(a5)
    1c88:	0055869b          	addiw	a3,a1,5
    1c8c:	f0c6ffe3          	bleu	a2,a3,1baa <strncpy+0xba>
    1c90:	000782a3          	sb	zero,5(a5)
    1c94:	0065869b          	addiw	a3,a1,6
    1c98:	f0c6f9e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1c9c:	00078323          	sb	zero,6(a5)
    1ca0:	0075869b          	addiw	a3,a1,7
    1ca4:	f0c6f3e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1ca8:	000783a3          	sb	zero,7(a5)
    1cac:	0085869b          	addiw	a3,a1,8
    1cb0:	eec6fde3          	bleu	a2,a3,1baa <strncpy+0xba>
    1cb4:	00078423          	sb	zero,8(a5)
    1cb8:	0095869b          	addiw	a3,a1,9
    1cbc:	eec6f7e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1cc0:	000784a3          	sb	zero,9(a5)
    1cc4:	00a5869b          	addiw	a3,a1,10
    1cc8:	eec6f1e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1ccc:	00078523          	sb	zero,10(a5)
    1cd0:	00b5869b          	addiw	a3,a1,11
    1cd4:	ecc6fbe3          	bleu	a2,a3,1baa <strncpy+0xba>
    1cd8:	000785a3          	sb	zero,11(a5)
    1cdc:	00c5869b          	addiw	a3,a1,12
    1ce0:	ecc6f5e3          	bleu	a2,a3,1baa <strncpy+0xba>
    1ce4:	00078623          	sb	zero,12(a5)
    1ce8:	25b5                	addiw	a1,a1,13
    1cea:	ecc5f0e3          	bleu	a2,a1,1baa <strncpy+0xba>
    1cee:	000786a3          	sb	zero,13(a5)
}
    1cf2:	853a                	mv	a0,a4
    1cf4:	8082                	ret
    1cf6:	46ad                	li	a3,11
    1cf8:	bdd1                	j	1bcc <strncpy+0xdc>
    1cfa:	00778693          	addi	a3,a5,7
    1cfe:	452d                	li	a0,11
    1d00:	fff60593          	addi	a1,a2,-1
    1d04:	eca6f4e3          	bleu	a0,a3,1bcc <strncpy+0xdc>
    1d08:	b7fd                	j	1cf6 <strncpy+0x206>
    1d0a:	40e007b3          	neg	a5,a4
    1d0e:	8832                	mv	a6,a2
    1d10:	8b9d                	andi	a5,a5,7
    1d12:	4581                	li	a1,0
    1d14:	ea0607e3          	beqz	a2,1bc2 <strncpy+0xd2>
    1d18:	b7cd                	j	1cfa <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d1a:	872a                	mv	a4,a0
}
    1d1c:	853a                	mv	a0,a4
    1d1e:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d20:	458d                	li	a1,3
    1d22:	b739                	j	1c30 <strncpy+0x140>
    1d24:	4585                	li	a1,1
    1d26:	b729                	j	1c30 <strncpy+0x140>
    1d28:	86ba                	mv	a3,a4
    1d2a:	4581                	li	a1,0
    1d2c:	b711                	j	1c30 <strncpy+0x140>
    1d2e:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d32:	872a                	mv	a4,a0
    1d34:	85b6                	mv	a1,a3
    1d36:	bda9                	j	1b90 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d38:	87ba                	mv	a5,a4
    1d3a:	4581                	li	a1,0
    1d3c:	bf21                	j	1c54 <strncpy+0x164>
    1d3e:	4589                	li	a1,2
    1d40:	bdc5                	j	1c30 <strncpy+0x140>
    1d42:	4591                	li	a1,4
    1d44:	b5f5                	j	1c30 <strncpy+0x140>
    1d46:	4595                	li	a1,5
    1d48:	b5e5                	j	1c30 <strncpy+0x140>
    1d4a:	4599                	li	a1,6
    1d4c:	b5d5                	j	1c30 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d4e:	00d50023          	sb	a3,0(a0)
    1d52:	872a                	mv	a4,a0
    1d54:	b5b9                	j	1ba2 <strncpy+0xb2>

0000000000001d56 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d56:	87aa                	mv	a5,a0
    1d58:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d5a:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d5e:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d62:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d64:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d66:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <openat>:
    register long a7 __asm__("a7") = n;
    1d6e:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d72:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d76:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d7a:	2501                	sext.w	a0,a0
    1d7c:	8082                	ret

0000000000001d7e <close>:
    register long a7 __asm__("a7") = n;
    1d7e:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d82:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d86:	2501                	sext.w	a0,a0
    1d88:	8082                	ret

0000000000001d8a <read>:
    register long a7 __asm__("a7") = n;
    1d8a:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8e:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d92:	8082                	ret

0000000000001d94 <write>:
    register long a7 __asm__("a7") = n;
    1d94:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d98:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d9c:	8082                	ret

0000000000001d9e <getpid>:
    register long a7 __asm__("a7") = n;
    1d9e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1da2:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1da6:	2501                	sext.w	a0,a0
    1da8:	8082                	ret

0000000000001daa <getppid>:
    register long a7 __asm__("a7") = n;
    1daa:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1dae:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1db6:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dba:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dbe:	2501                	sext.w	a0,a0
    1dc0:	8082                	ret

0000000000001dc2 <fork>:
    register long a7 __asm__("a7") = n;
    1dc2:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dc6:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dc8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dca:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dce:	2501                	sext.w	a0,a0
    1dd0:	8082                	ret

0000000000001dd2 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dd2:	85b2                	mv	a1,a2
    1dd4:	863a                	mv	a2,a4
    if (stack)
    1dd6:	c191                	beqz	a1,1dda <clone+0x8>
	stack += stack_size;
    1dd8:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dda:	4781                	li	a5,0
    1ddc:	4701                	li	a4,0
    1dde:	4681                	li	a3,0
    1de0:	2601                	sext.w	a2,a2
    1de2:	1ec0006f          	j	1fce <__clone>

0000000000001de6 <exit>:
    register long a7 __asm__("a7") = n;
    1de6:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dea:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dee:	8082                	ret

0000000000001df0 <waitpid>:
    register long a7 __asm__("a7") = n;
    1df0:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1df4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df6:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <exec>:
    register long a7 __asm__("a7") = n;
    1dfe:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e02:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e06:	2501                	sext.w	a0,a0
    1e08:	8082                	ret

0000000000001e0a <execve>:
    register long a7 __asm__("a7") = n;
    1e0a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e0e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e12:	2501                	sext.w	a0,a0
    1e14:	8082                	ret

0000000000001e16 <times>:
    register long a7 __asm__("a7") = n;
    1e16:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e1a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e1e:	2501                	sext.w	a0,a0
    1e20:	8082                	ret

0000000000001e22 <get_time>:

int64 get_time()
{
    1e22:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e24:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e28:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e2a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e30:	2501                	sext.w	a0,a0
    1e32:	ed09                	bnez	a0,1e4c <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e34:	67a2                	ld	a5,8(sp)
    1e36:	3e800713          	li	a4,1000
    1e3a:	00015503          	lhu	a0,0(sp)
    1e3e:	02e7d7b3          	divu	a5,a5,a4
    1e42:	02e50533          	mul	a0,a0,a4
    1e46:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e48:	0141                	addi	sp,sp,16
    1e4a:	8082                	ret
        return -1;
    1e4c:	557d                	li	a0,-1
    1e4e:	bfed                	j	1e48 <get_time+0x26>

0000000000001e50 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e50:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e54:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e58:	2501                	sext.w	a0,a0
    1e5a:	8082                	ret

0000000000001e5c <time>:
    register long a7 __asm__("a7") = n;
    1e5c:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e60:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e64:	2501                	sext.w	a0,a0
    1e66:	8082                	ret

0000000000001e68 <sleep>:

int sleep(unsigned long long time)
{
    1e68:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e6a:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e6c:	850a                	mv	a0,sp
    1e6e:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e70:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e74:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e76:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e7a:	e501                	bnez	a0,1e82 <sleep+0x1a>
    return 0;
    1e7c:	4501                	li	a0,0
}
    1e7e:	0141                	addi	sp,sp,16
    1e80:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e82:	4502                	lw	a0,0(sp)
}
    1e84:	0141                	addi	sp,sp,16
    1e86:	8082                	ret

0000000000001e88 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e88:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e94:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e98:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e9c:	8082                	ret

0000000000001e9e <munmap>:
    register long a7 __asm__("a7") = n;
    1e9e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea2:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <wait>:

int wait(int *code)
{
    1eaa:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eac:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eb0:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1eb2:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eb4:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eb6:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <spawn>:
    register long a7 __asm__("a7") = n;
    1ebe:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ec2:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <mailread>:
    register long a7 __asm__("a7") = n;
    1eca:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ece:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ed2:	2501                	sext.w	a0,a0
    1ed4:	8082                	ret

0000000000001ed6 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ed6:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eda:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <fstat>:
    register long a7 __asm__("a7") = n;
    1ee2:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee6:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eea:	2501                	sext.w	a0,a0
    1eec:	8082                	ret

0000000000001eee <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1eee:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ef0:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ef4:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef6:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1efa:	2501                	sext.w	a0,a0
    1efc:	8082                	ret

0000000000001efe <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1efe:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f00:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f04:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f06:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <link>:

int link(char *old_path, char *new_path)
{
    1f0e:	87aa                	mv	a5,a0
    1f10:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f12:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f16:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f1a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f1c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f20:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f22:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <unlink>:

int unlink(char *path)
{
    1f2a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f2c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f30:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f34:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f36:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f3a:	2501                	sext.w	a0,a0
    1f3c:	8082                	ret

0000000000001f3e <uname>:
    register long a7 __asm__("a7") = n;
    1f3e:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f42:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f46:	2501                	sext.w	a0,a0
    1f48:	8082                	ret

0000000000001f4a <brk>:
    register long a7 __asm__("a7") = n;
    1f4a:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f4e:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f56:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f58:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f5c:	8082                	ret

0000000000001f5e <chdir>:
    register long a7 __asm__("a7") = n;
    1f5e:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f62:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f66:	2501                	sext.w	a0,a0
    1f68:	8082                	ret

0000000000001f6a <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f6a:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f6c:	02059613          	slli	a2,a1,0x20
    1f70:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f72:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f76:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f7a:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7c:	00000073          	ecall
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <getdents>:
    register long a7 __asm__("a7") = n;
    1f84:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f88:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <pipe>:
    register long a7 __asm__("a7") = n;
    1f90:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f94:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f96:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <dup>:
    register long a7 __asm__("a7") = n;
    1f9e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fa0:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fa4:	2501                	sext.w	a0,a0
    1fa6:	8082                	ret

0000000000001fa8 <dup2>:
    register long a7 __asm__("a7") = n;
    1fa8:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1faa:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fac:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fb0:	2501                	sext.w	a0,a0
    1fb2:	8082                	ret

0000000000001fb4 <mount>:
    register long a7 __asm__("a7") = n;
    1fb4:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fb8:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fbc:	2501                	sext.w	a0,a0
    1fbe:	8082                	ret

0000000000001fc0 <umount>:
    register long a7 __asm__("a7") = n;
    1fc0:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fc4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fc6:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fca:	2501                	sext.w	a0,a0
    1fcc:	8082                	ret

0000000000001fce <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fce:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fd0:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fd2:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fd4:	8532                	mv	a0,a2
	mv a2, a4
    1fd6:	863a                	mv	a2,a4
	mv a3, a5
    1fd8:	86be                	mv	a3,a5
	mv a4, a6
    1fda:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fdc:	0dc00893          	li	a7,220
	ecall
    1fe0:	00000073          	ecall

	beqz a0, 1f
    1fe4:	c111                	beqz	a0,1fe8 <__clone+0x1a>
	# Parent
	ret
    1fe6:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fe8:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fea:	6522                	ld	a0,8(sp)
	jalr a1
    1fec:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fee:	05d00893          	li	a7,93
	ecall
    1ff2:	00000073          	ecall
