
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/dup2:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0a00006f          	j	10a2 <__start_main>

0000000000001006 <test_dup2>:

/*
 * 测试通过时应输出：
 * "  from fd 100"
 */
void test_dup2(){
    1006:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fd850513          	addi	a0,a0,-40 # 1fe0 <__clone+0x2e>
void test_dup2(){
    1010:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1012:	290000ef          	jal	ra,12a2 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	05250513          	addi	a0,a0,82 # 2068 <__func__.1211>
    101e:	284000ef          	jal	ra,12a2 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fd650513          	addi	a0,a0,-42 # 1ff8 <__clone+0x46>
    102a:	278000ef          	jal	ra,12a2 <puts>
	int fd = dup2(STDOUT, 100);
    102e:	06400593          	li	a1,100
    1032:	4505                	li	a0,1
    1034:	759000ef          	jal	ra,1f8c <dup2>
	assert(fd != -1);
    1038:	57fd                	li	a5,-1
    103a:	04f50563          	beq	a0,a5,1084 <test_dup2+0x7e>
	const char *str = "  from fd 100\n";
	write(100, str, strlen(str));
    103e:	00001517          	auipc	a0,0x1
    1042:	fea50513          	addi	a0,a0,-22 # 2028 <__clone+0x76>
    1046:	017000ef          	jal	ra,185c <strlen>
    104a:	862a                	mv	a2,a0
    104c:	00001597          	auipc	a1,0x1
    1050:	fdc58593          	addi	a1,a1,-36 # 2028 <__clone+0x76>
    1054:	06400513          	li	a0,100
    1058:	521000ef          	jal	ra,1d78 <write>
	TEST_END(__func__);
    105c:	00001517          	auipc	a0,0x1
    1060:	fdc50513          	addi	a0,a0,-36 # 2038 <__clone+0x86>
    1064:	23e000ef          	jal	ra,12a2 <puts>
    1068:	00001517          	auipc	a0,0x1
    106c:	00050513          	mv	a0,a0
    1070:	232000ef          	jal	ra,12a2 <puts>
}
    1074:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1076:	00001517          	auipc	a0,0x1
    107a:	f8250513          	addi	a0,a0,-126 # 1ff8 <__clone+0x46>
}
    107e:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    1080:	2220006f          	j	12a2 <puts>
	assert(fd != -1);
    1084:	00001517          	auipc	a0,0x1
    1088:	f8450513          	addi	a0,a0,-124 # 2008 <__clone+0x56>
    108c:	4dc000ef          	jal	ra,1568 <panic>
    1090:	b77d                	j	103e <test_dup2+0x38>

0000000000001092 <main>:

int main(void) {
    1092:	1141                	addi	sp,sp,-16
    1094:	e406                	sd	ra,8(sp)
	test_dup2();
    1096:	f71ff0ef          	jal	ra,1006 <test_dup2>
	return 0;
}
    109a:	60a2                	ld	ra,8(sp)
    109c:	4501                	li	a0,0
    109e:	0141                	addi	sp,sp,16
    10a0:	8082                	ret

00000000000010a2 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10a2:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10a4:	4108                	lw	a0,0(a0)
{
    10a6:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10a8:	05a1                	addi	a1,a1,8
{
    10aa:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ac:	fe7ff0ef          	jal	ra,1092 <main>
    10b0:	51b000ef          	jal	ra,1dca <exit>
	return 0;
}
    10b4:	60a2                	ld	ra,8(sp)
    10b6:	4501                	li	a0,0
    10b8:	0141                	addi	sp,sp,16
    10ba:	8082                	ret

00000000000010bc <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10bc:	7179                	addi	sp,sp,-48
    10be:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10c0:	12054e63          	bltz	a0,11fc <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10c4:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10c8:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10ca:	02b7f6bb          	remuw	a3,a5,a1
    10ce:	00001717          	auipc	a4,0x1
    10d2:	faa70713          	addi	a4,a4,-86 # 2078 <digits>
    buf[16] = 0;
    10d6:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10da:	1682                	slli	a3,a3,0x20
    10dc:	9281                	srli	a3,a3,0x20
    10de:	96ba                	add	a3,a3,a4
    10e0:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10e4:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10e8:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10ec:	16b7e363          	bltu	a5,a1,1252 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10f0:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10f4:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10f8:	1602                	slli	a2,a2,0x20
    10fa:	9201                	srli	a2,a2,0x20
    10fc:	963a                	add	a2,a2,a4
    10fe:	00064603          	lbu	a2,0(a2)
    1102:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1106:	0007861b          	sext.w	a2,a5
    110a:	12b6e863          	bltu	a3,a1,123a <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    110e:	02b7f6bb          	remuw	a3,a5,a1
    1112:	1682                	slli	a3,a3,0x20
    1114:	9281                	srli	a3,a3,0x20
    1116:	96ba                	add	a3,a3,a4
    1118:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    111c:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1120:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1124:	10b66e63          	bltu	a2,a1,1240 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1128:	02b876bb          	remuw	a3,a6,a1
    112c:	1682                	slli	a3,a3,0x20
    112e:	9281                	srli	a3,a3,0x20
    1130:	96ba                	add	a3,a3,a4
    1132:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1136:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    113a:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    113e:	10b86463          	bltu	a6,a1,1246 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1142:	02b676bb          	remuw	a3,a2,a1
    1146:	1682                	slli	a3,a3,0x20
    1148:	9281                	srli	a3,a3,0x20
    114a:	96ba                	add	a3,a3,a4
    114c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1150:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1154:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1158:	0eb66a63          	bltu	a2,a1,124c <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    115c:	02b876bb          	remuw	a3,a6,a1
    1160:	1682                	slli	a3,a3,0x20
    1162:	9281                	srli	a3,a3,0x20
    1164:	96ba                	add	a3,a3,a4
    1166:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116a:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    116e:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1172:	0cb86163          	bltu	a6,a1,1234 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1176:	02b676bb          	remuw	a3,a2,a1
    117a:	1682                	slli	a3,a3,0x20
    117c:	9281                	srli	a3,a3,0x20
    117e:	96ba                	add	a3,a3,a4
    1180:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1184:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1188:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    118c:	0cb66563          	bltu	a2,a1,1256 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1190:	02b876bb          	remuw	a3,a6,a1
    1194:	1682                	slli	a3,a3,0x20
    1196:	9281                	srli	a3,a3,0x20
    1198:	96ba                	add	a3,a3,a4
    119a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    119e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11a2:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11a6:	0ab86b63          	bltu	a6,a1,125c <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11aa:	02b676bb          	remuw	a3,a2,a1
    11ae:	1682                	slli	a3,a3,0x20
    11b0:	9281                	srli	a3,a3,0x20
    11b2:	96ba                	add	a3,a3,a4
    11b4:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b8:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11bc:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11c0:	0ab66163          	bltu	a2,a1,1262 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11c4:	1782                	slli	a5,a5,0x20
    11c6:	9381                	srli	a5,a5,0x20
    11c8:	97ba                	add	a5,a5,a4
    11ca:	0007c703          	lbu	a4,0(a5)
    11ce:	4599                	li	a1,6
    11d0:	4795                	li	a5,5
    11d2:	00e10723          	sb	a4,14(sp)

    if (sign)
    11d6:	00055963          	bgez	a0,11e8 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11da:	1018                	addi	a4,sp,32
    11dc:	973e                	add	a4,a4,a5
    11de:	02d00693          	li	a3,45
    11e2:	fed70423          	sb	a3,-24(a4)
    11e6:	85be                	mv	a1,a5
    write(f, s, l);
    11e8:	003c                	addi	a5,sp,8
    11ea:	4641                	li	a2,16
    11ec:	9e0d                	subw	a2,a2,a1
    11ee:	4505                	li	a0,1
    11f0:	95be                	add	a1,a1,a5
    11f2:	387000ef          	jal	ra,1d78 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f6:	70a2                	ld	ra,40(sp)
    11f8:	6145                	addi	sp,sp,48
    11fa:	8082                	ret
        x = -xx;
    11fc:	40a0063b          	negw	a2,a0
    1200:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1202:	02b677bb          	remuw	a5,a2,a1
    1206:	00001717          	auipc	a4,0x1
    120a:	e7270713          	addi	a4,a4,-398 # 2078 <digits>
    buf[16] = 0;
    120e:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1212:	1782                	slli	a5,a5,0x20
    1214:	9381                	srli	a5,a5,0x20
    1216:	97ba                	add	a5,a5,a4
    1218:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    121c:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1220:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1224:	ecb676e3          	bleu	a1,a2,10f0 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1228:	02d00793          	li	a5,45
    122c:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1230:	45b9                	li	a1,14
    1232:	bf5d                	j	11e8 <printint.constprop.0+0x12c>
    1234:	47a5                	li	a5,9
    1236:	45a9                	li	a1,10
    1238:	bf79                	j	11d6 <printint.constprop.0+0x11a>
    123a:	47b5                	li	a5,13
    123c:	45b9                	li	a1,14
    123e:	bf61                	j	11d6 <printint.constprop.0+0x11a>
    1240:	47b1                	li	a5,12
    1242:	45b5                	li	a1,13
    1244:	bf49                	j	11d6 <printint.constprop.0+0x11a>
    1246:	47ad                	li	a5,11
    1248:	45b1                	li	a1,12
    124a:	b771                	j	11d6 <printint.constprop.0+0x11a>
    124c:	47a9                	li	a5,10
    124e:	45ad                	li	a1,11
    1250:	b759                	j	11d6 <printint.constprop.0+0x11a>
    i = 15;
    1252:	45bd                	li	a1,15
    1254:	bf51                	j	11e8 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1256:	47a1                	li	a5,8
    1258:	45a5                	li	a1,9
    125a:	bfb5                	j	11d6 <printint.constprop.0+0x11a>
    125c:	479d                	li	a5,7
    125e:	45a1                	li	a1,8
    1260:	bf9d                	j	11d6 <printint.constprop.0+0x11a>
    1262:	4799                	li	a5,6
    1264:	459d                	li	a1,7
    1266:	bf85                	j	11d6 <printint.constprop.0+0x11a>

0000000000001268 <getchar>:
{
    1268:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    126a:	00f10593          	addi	a1,sp,15
    126e:	4605                	li	a2,1
    1270:	4501                	li	a0,0
{
    1272:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1274:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1278:	2f7000ef          	jal	ra,1d6e <read>
}
    127c:	60e2                	ld	ra,24(sp)
    127e:	00f14503          	lbu	a0,15(sp)
    1282:	6105                	addi	sp,sp,32
    1284:	8082                	ret

0000000000001286 <putchar>:
{
    1286:	1101                	addi	sp,sp,-32
    char byte = c;
    1288:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    128c:	00f10593          	addi	a1,sp,15
    1290:	4605                	li	a2,1
    1292:	4505                	li	a0,1
{
    1294:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1296:	2e3000ef          	jal	ra,1d78 <write>
}
    129a:	60e2                	ld	ra,24(sp)
    129c:	2501                	sext.w	a0,a0
    129e:	6105                	addi	sp,sp,32
    12a0:	8082                	ret

00000000000012a2 <puts>:
{
    12a2:	1141                	addi	sp,sp,-16
    12a4:	e406                	sd	ra,8(sp)
    12a6:	e022                	sd	s0,0(sp)
    12a8:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12aa:	5b2000ef          	jal	ra,185c <strlen>
    12ae:	862a                	mv	a2,a0
    12b0:	85a2                	mv	a1,s0
    12b2:	4505                	li	a0,1
    12b4:	2c5000ef          	jal	ra,1d78 <write>
}
    12b8:	60a2                	ld	ra,8(sp)
    12ba:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12bc:	957d                	srai	a0,a0,0x3f
    return r;
    12be:	2501                	sext.w	a0,a0
}
    12c0:	0141                	addi	sp,sp,16
    12c2:	8082                	ret

00000000000012c4 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12c4:	7131                	addi	sp,sp,-192
    12c6:	e0da                	sd	s6,64(sp)
    12c8:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12ca:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12cc:	013c                	addi	a5,sp,136
{
    12ce:	f0ca                	sd	s2,96(sp)
    12d0:	ecce                	sd	s3,88(sp)
    12d2:	e8d2                	sd	s4,80(sp)
    12d4:	e4d6                	sd	s5,72(sp)
    12d6:	fc5e                	sd	s7,56(sp)
    12d8:	fc86                	sd	ra,120(sp)
    12da:	f8a2                	sd	s0,112(sp)
    12dc:	f4a6                	sd	s1,104(sp)
    12de:	89aa                	mv	s3,a0
    12e0:	e52e                	sd	a1,136(sp)
    12e2:	e932                	sd	a2,144(sp)
    12e4:	ed36                	sd	a3,152(sp)
    12e6:	f13a                	sd	a4,160(sp)
    12e8:	f942                	sd	a6,176(sp)
    12ea:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12ec:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12ee:	02500913          	li	s2,37
    12f2:	07000a93          	li	s5,112
    buf[i++] = '0';
    12f6:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12fa:	00001a17          	auipc	s4,0x1
    12fe:	d7ea0a13          	addi	s4,s4,-642 # 2078 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1302:	00001b97          	auipc	s7,0x1
    1306:	d46b8b93          	addi	s7,s7,-698 # 2048 <__clone+0x96>
        if (!*s)
    130a:	0009c783          	lbu	a5,0(s3)
    130e:	cfb9                	beqz	a5,136c <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1310:	23278d63          	beq	a5,s2,154a <printf+0x286>
    1314:	864e                	mv	a2,s3
    1316:	a019                	j	131c <printf+0x58>
    1318:	07278563          	beq	a5,s2,1382 <printf+0xbe>
    131c:	0605                	addi	a2,a2,1
    131e:	00064783          	lbu	a5,0(a2)
    1322:	fbfd                	bnez	a5,1318 <printf+0x54>
    1324:	84b2                	mv	s1,a2
        l = z - a;
    1326:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    132a:	8622                	mv	a2,s0
    132c:	85ce                	mv	a1,s3
    132e:	4505                	li	a0,1
    1330:	249000ef          	jal	ra,1d78 <write>
        if (l)
    1334:	ec3d                	bnez	s0,13b2 <printf+0xee>
        if (s[1] == 0)
    1336:	0014c783          	lbu	a5,1(s1)
    133a:	cb8d                	beqz	a5,136c <printf+0xa8>
        switch (s[1])
    133c:	09578b63          	beq	a5,s5,13d2 <printf+0x10e>
    1340:	06fafb63          	bleu	a5,s5,13b6 <printf+0xf2>
    1344:	07300713          	li	a4,115
    1348:	1ce78e63          	beq	a5,a4,1524 <printf+0x260>
    134c:	07800713          	li	a4,120
    1350:	1ae79563          	bne	a5,a4,14fa <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1354:	6782                	ld	a5,0(sp)
    1356:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1358:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    135c:	4388                	lw	a0,0(a5)
    135e:	07a1                	addi	a5,a5,8
    1360:	e03e                	sd	a5,0(sp)
    1362:	d5bff0ef          	jal	ra,10bc <printint.constprop.0>
        if (!*s)
    1366:	0009c783          	lbu	a5,0(s3)
    136a:	f3dd                	bnez	a5,1310 <printf+0x4c>
    }
    va_end(ap);
}
    136c:	70e6                	ld	ra,120(sp)
    136e:	7446                	ld	s0,112(sp)
    1370:	74a6                	ld	s1,104(sp)
    1372:	7906                	ld	s2,96(sp)
    1374:	69e6                	ld	s3,88(sp)
    1376:	6a46                	ld	s4,80(sp)
    1378:	6aa6                	ld	s5,72(sp)
    137a:	6b06                	ld	s6,64(sp)
    137c:	7be2                	ld	s7,56(sp)
    137e:	6129                	addi	sp,sp,192
    1380:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1382:	00164783          	lbu	a5,1(a2)
    1386:	84b2                	mv	s1,a2
    1388:	01278763          	beq	a5,s2,1396 <printf+0xd2>
    138c:	bf69                	j	1326 <printf+0x62>
    138e:	0014c783          	lbu	a5,1(s1)
    1392:	f9279ae3          	bne	a5,s2,1326 <printf+0x62>
    1396:	0489                	addi	s1,s1,2
    1398:	0004c783          	lbu	a5,0(s1)
    139c:	0605                	addi	a2,a2,1
    139e:	ff2788e3          	beq	a5,s2,138e <printf+0xca>
        l = z - a;
    13a2:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13a6:	8622                	mv	a2,s0
    13a8:	85ce                	mv	a1,s3
    13aa:	4505                	li	a0,1
    13ac:	1cd000ef          	jal	ra,1d78 <write>
        if (l)
    13b0:	d059                	beqz	s0,1336 <printf+0x72>
    13b2:	89a6                	mv	s3,s1
    13b4:	bf99                	j	130a <printf+0x46>
    13b6:	06400713          	li	a4,100
    13ba:	14e79063          	bne	a5,a4,14fa <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13be:	6782                	ld	a5,0(sp)
    13c0:	45a9                	li	a1,10
        s += 2;
    13c2:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13c6:	4388                	lw	a0,0(a5)
    13c8:	07a1                	addi	a5,a5,8
    13ca:	e03e                	sd	a5,0(sp)
    13cc:	cf1ff0ef          	jal	ra,10bc <printint.constprop.0>
        s += 2;
    13d0:	bf59                	j	1366 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13d2:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13d4:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d8:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13da:	631c                	ld	a5,0(a4)
    13dc:	0721                	addi	a4,a4,8
    13de:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e0:	00479293          	slli	t0,a5,0x4
    13e4:	00879f93          	slli	t6,a5,0x8
    13e8:	00c79f13          	slli	t5,a5,0xc
    13ec:	01079e93          	slli	t4,a5,0x10
    13f0:	01479e13          	slli	t3,a5,0x14
    13f4:	01879313          	slli	t1,a5,0x18
    13f8:	01c79893          	slli	a7,a5,0x1c
    13fc:	02479813          	slli	a6,a5,0x24
    1400:	02879513          	slli	a0,a5,0x28
    1404:	02c79593          	slli	a1,a5,0x2c
    1408:	03079693          	slli	a3,a5,0x30
    140c:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1410:	03c7d413          	srli	s0,a5,0x3c
    1414:	01c7d39b          	srliw	t2,a5,0x1c
    1418:	03c2d293          	srli	t0,t0,0x3c
    141c:	03cfdf93          	srli	t6,t6,0x3c
    1420:	03cf5f13          	srli	t5,t5,0x3c
    1424:	03cede93          	srli	t4,t4,0x3c
    1428:	03ce5e13          	srli	t3,t3,0x3c
    142c:	03c35313          	srli	t1,t1,0x3c
    1430:	03c8d893          	srli	a7,a7,0x3c
    1434:	03c85813          	srli	a6,a6,0x3c
    1438:	9171                	srli	a0,a0,0x3c
    143a:	91f1                	srli	a1,a1,0x3c
    143c:	92f1                	srli	a3,a3,0x3c
    143e:	9371                	srli	a4,a4,0x3c
    1440:	96d2                	add	a3,a3,s4
    1442:	9752                	add	a4,a4,s4
    1444:	9452                	add	s0,s0,s4
    1446:	92d2                	add	t0,t0,s4
    1448:	9fd2                	add	t6,t6,s4
    144a:	9f52                	add	t5,t5,s4
    144c:	9ed2                	add	t4,t4,s4
    144e:	9e52                	add	t3,t3,s4
    1450:	9352                	add	t1,t1,s4
    1452:	98d2                	add	a7,a7,s4
    1454:	93d2                	add	t2,t2,s4
    1456:	9852                	add	a6,a6,s4
    1458:	9552                	add	a0,a0,s4
    145a:	95d2                	add	a1,a1,s4
    145c:	0006c983          	lbu	s3,0(a3)
    1460:	0002c283          	lbu	t0,0(t0)
    1464:	00074683          	lbu	a3,0(a4)
    1468:	000fcf83          	lbu	t6,0(t6)
    146c:	000f4f03          	lbu	t5,0(t5)
    1470:	000ece83          	lbu	t4,0(t4)
    1474:	000e4e03          	lbu	t3,0(t3)
    1478:	00034303          	lbu	t1,0(t1)
    147c:	0008c883          	lbu	a7,0(a7)
    1480:	0003c383          	lbu	t2,0(t2)
    1484:	00084803          	lbu	a6,0(a6)
    1488:	00054503          	lbu	a0,0(a0)
    148c:	0005c583          	lbu	a1,0(a1)
    1490:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1494:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1498:	9371                	srli	a4,a4,0x3c
    149a:	8bbd                	andi	a5,a5,15
    149c:	9752                	add	a4,a4,s4
    149e:	97d2                	add	a5,a5,s4
    14a0:	005105a3          	sb	t0,11(sp)
    14a4:	01f10623          	sb	t6,12(sp)
    14a8:	01e106a3          	sb	t5,13(sp)
    14ac:	01d10723          	sb	t4,14(sp)
    14b0:	01c107a3          	sb	t3,15(sp)
    14b4:	00610823          	sb	t1,16(sp)
    14b8:	011108a3          	sb	a7,17(sp)
    14bc:	00710923          	sb	t2,18(sp)
    14c0:	010109a3          	sb	a6,19(sp)
    14c4:	00a10a23          	sb	a0,20(sp)
    14c8:	00b10aa3          	sb	a1,21(sp)
    14cc:	01310b23          	sb	s3,22(sp)
    14d0:	00d10ba3          	sb	a3,23(sp)
    14d4:	00810523          	sb	s0,10(sp)
    14d8:	00074703          	lbu	a4,0(a4)
    14dc:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e0:	002c                	addi	a1,sp,8
    14e2:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14e4:	00e10c23          	sb	a4,24(sp)
    14e8:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14ec:	00010d23          	sb	zero,26(sp)
        s += 2;
    14f0:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14f4:	085000ef          	jal	ra,1d78 <write>
        s += 2;
    14f8:	b5bd                	j	1366 <printf+0xa2>
    char byte = c;
    14fa:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14fe:	4605                	li	a2,1
    1500:	002c                	addi	a1,sp,8
    1502:	4505                	li	a0,1
    char byte = c;
    1504:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1508:	071000ef          	jal	ra,1d78 <write>
    char byte = c;
    150c:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1510:	4605                	li	a2,1
    1512:	002c                	addi	a1,sp,8
    1514:	4505                	li	a0,1
    char byte = c;
    1516:	00f10423          	sb	a5,8(sp)
        s += 2;
    151a:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    151e:	05b000ef          	jal	ra,1d78 <write>
        s += 2;
    1522:	b591                	j	1366 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1524:	6782                	ld	a5,0(sp)
    1526:	6380                	ld	s0,0(a5)
    1528:	07a1                	addi	a5,a5,8
    152a:	e03e                	sd	a5,0(sp)
    152c:	cc05                	beqz	s0,1564 <printf+0x2a0>
            l = strnlen(a, 200);
    152e:	0c800593          	li	a1,200
    1532:	8522                	mv	a0,s0
    1534:	45a000ef          	jal	ra,198e <strnlen>
    write(f, s, l);
    1538:	0005061b          	sext.w	a2,a0
    153c:	85a2                	mv	a1,s0
    153e:	4505                	li	a0,1
    1540:	039000ef          	jal	ra,1d78 <write>
        s += 2;
    1544:	00248993          	addi	s3,s1,2
    1548:	bd39                	j	1366 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    154a:	0019c783          	lbu	a5,1(s3)
    154e:	84ce                	mv	s1,s3
    1550:	864e                	mv	a2,s3
    1552:	e52782e3          	beq	a5,s2,1396 <printf+0xd2>
    write(f, s, l);
    1556:	4601                	li	a2,0
    1558:	85ce                	mv	a1,s3
    155a:	4505                	li	a0,1
    155c:	01d000ef          	jal	ra,1d78 <write>
    1560:	84ce                	mv	s1,s3
    1562:	bbd1                	j	1336 <printf+0x72>
                a = "(null)";
    1564:	845e                	mv	s0,s7
    1566:	b7e1                	j	152e <printf+0x26a>

0000000000001568 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1568:	1141                	addi	sp,sp,-16
    156a:	e406                	sd	ra,8(sp)
    puts(m);
    156c:	d37ff0ef          	jal	ra,12a2 <puts>
    exit(-100);
}
    1570:	60a2                	ld	ra,8(sp)
    exit(-100);
    1572:	f9c00513          	li	a0,-100
}
    1576:	0141                	addi	sp,sp,16
    exit(-100);
    1578:	0530006f          	j	1dca <exit>

000000000000157c <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    157c:	02000793          	li	a5,32
    1580:	00f50663          	beq	a0,a5,158c <isspace+0x10>
    1584:	355d                	addiw	a0,a0,-9
    1586:	00553513          	sltiu	a0,a0,5
    158a:	8082                	ret
    158c:	4505                	li	a0,1
}
    158e:	8082                	ret

0000000000001590 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1590:	fd05051b          	addiw	a0,a0,-48
}
    1594:	00a53513          	sltiu	a0,a0,10
    1598:	8082                	ret

000000000000159a <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    159a:	02000613          	li	a2,32
    159e:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15a0:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a4:	0007079b          	sext.w	a5,a4
    15a8:	ff77869b          	addiw	a3,a5,-9
    15ac:	04c70b63          	beq	a4,a2,1602 <atoi+0x68>
    15b0:	04d5f963          	bleu	a3,a1,1602 <atoi+0x68>
        s++;
    switch (*s)
    15b4:	02b00693          	li	a3,43
    15b8:	04d70a63          	beq	a4,a3,160c <atoi+0x72>
    15bc:	02d00693          	li	a3,45
    15c0:	06d70463          	beq	a4,a3,1628 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15c4:	fd07859b          	addiw	a1,a5,-48
    15c8:	4625                	li	a2,9
    15ca:	873e                	mv	a4,a5
    15cc:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15ce:	4e01                	li	t3,0
    while (isdigit(*s))
    15d0:	04b66a63          	bltu	a2,a1,1624 <atoi+0x8a>
    int n = 0, neg = 0;
    15d4:	4501                	li	a0,0
    while (isdigit(*s))
    15d6:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15d8:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15da:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15de:	0025179b          	slliw	a5,a0,0x2
    15e2:	9d3d                	addw	a0,a0,a5
    15e4:	fd07031b          	addiw	t1,a4,-48
    15e8:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15ec:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15f0:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15f4:	0006071b          	sext.w	a4,a2
    15f8:	feb870e3          	bleu	a1,a6,15d8 <atoi+0x3e>
    return neg ? n : -n;
    15fc:	000e0563          	beqz	t3,1606 <atoi+0x6c>
}
    1600:	8082                	ret
        s++;
    1602:	0505                	addi	a0,a0,1
    1604:	bf71                	j	15a0 <atoi+0x6>
    1606:	4113053b          	subw	a0,t1,a7
    160a:	8082                	ret
    while (isdigit(*s))
    160c:	00154783          	lbu	a5,1(a0)
    1610:	4625                	li	a2,9
        s++;
    1612:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1616:	fd07859b          	addiw	a1,a5,-48
    161a:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    161e:	4e01                	li	t3,0
    while (isdigit(*s))
    1620:	fab67ae3          	bleu	a1,a2,15d4 <atoi+0x3a>
    1624:	4501                	li	a0,0
}
    1626:	8082                	ret
    while (isdigit(*s))
    1628:	00154783          	lbu	a5,1(a0)
    162c:	4625                	li	a2,9
        s++;
    162e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1632:	fd07859b          	addiw	a1,a5,-48
    1636:	0007871b          	sext.w	a4,a5
    163a:	feb665e3          	bltu	a2,a1,1624 <atoi+0x8a>
        neg = 1;
    163e:	4e05                	li	t3,1
    1640:	bf51                	j	15d4 <atoi+0x3a>

0000000000001642 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1642:	16060d63          	beqz	a2,17bc <memset+0x17a>
    1646:	40a007b3          	neg	a5,a0
    164a:	8b9d                	andi	a5,a5,7
    164c:	00778713          	addi	a4,a5,7
    1650:	482d                	li	a6,11
    1652:	0ff5f593          	andi	a1,a1,255
    1656:	fff60693          	addi	a3,a2,-1
    165a:	17076263          	bltu	a4,a6,17be <memset+0x17c>
    165e:	16e6ea63          	bltu	a3,a4,17d2 <memset+0x190>
    1662:	16078563          	beqz	a5,17cc <memset+0x18a>
    1666:	00b50023          	sb	a1,0(a0)
    166a:	4705                	li	a4,1
    166c:	00150e93          	addi	t4,a0,1
    1670:	14e78c63          	beq	a5,a4,17c8 <memset+0x186>
    1674:	00b500a3          	sb	a1,1(a0)
    1678:	4709                	li	a4,2
    167a:	00250e93          	addi	t4,a0,2
    167e:	14e78d63          	beq	a5,a4,17d8 <memset+0x196>
    1682:	00b50123          	sb	a1,2(a0)
    1686:	470d                	li	a4,3
    1688:	00350e93          	addi	t4,a0,3
    168c:	12e78b63          	beq	a5,a4,17c2 <memset+0x180>
    1690:	00b501a3          	sb	a1,3(a0)
    1694:	4711                	li	a4,4
    1696:	00450e93          	addi	t4,a0,4
    169a:	14e78163          	beq	a5,a4,17dc <memset+0x19a>
    169e:	00b50223          	sb	a1,4(a0)
    16a2:	4715                	li	a4,5
    16a4:	00550e93          	addi	t4,a0,5
    16a8:	12e78c63          	beq	a5,a4,17e0 <memset+0x19e>
    16ac:	00b502a3          	sb	a1,5(a0)
    16b0:	471d                	li	a4,7
    16b2:	00650e93          	addi	t4,a0,6
    16b6:	12e79763          	bne	a5,a4,17e4 <memset+0x1a2>
    16ba:	00750e93          	addi	t4,a0,7
    16be:	00b50323          	sb	a1,6(a0)
    16c2:	4f1d                	li	t5,7
    16c4:	00859713          	slli	a4,a1,0x8
    16c8:	8f4d                	or	a4,a4,a1
    16ca:	01059e13          	slli	t3,a1,0x10
    16ce:	01c76e33          	or	t3,a4,t3
    16d2:	01859313          	slli	t1,a1,0x18
    16d6:	006e6333          	or	t1,t3,t1
    16da:	02059893          	slli	a7,a1,0x20
    16de:	011368b3          	or	a7,t1,a7
    16e2:	02859813          	slli	a6,a1,0x28
    16e6:	40f60333          	sub	t1,a2,a5
    16ea:	0108e833          	or	a6,a7,a6
    16ee:	03059693          	slli	a3,a1,0x30
    16f2:	00d866b3          	or	a3,a6,a3
    16f6:	03859713          	slli	a4,a1,0x38
    16fa:	97aa                	add	a5,a5,a0
    16fc:	ff837813          	andi	a6,t1,-8
    1700:	8f55                	or	a4,a4,a3
    1702:	00f806b3          	add	a3,a6,a5
    1706:	e398                	sd	a4,0(a5)
    1708:	07a1                	addi	a5,a5,8
    170a:	fed79ee3          	bne	a5,a3,1706 <memset+0xc4>
    170e:	ff837693          	andi	a3,t1,-8
    1712:	00de87b3          	add	a5,t4,a3
    1716:	01e6873b          	addw	a4,a3,t5
    171a:	0ad30663          	beq	t1,a3,17c6 <memset+0x184>
    171e:	00b78023          	sb	a1,0(a5)
    1722:	0017069b          	addiw	a3,a4,1
    1726:	08c6fb63          	bleu	a2,a3,17bc <memset+0x17a>
    172a:	00b780a3          	sb	a1,1(a5)
    172e:	0027069b          	addiw	a3,a4,2
    1732:	08c6f563          	bleu	a2,a3,17bc <memset+0x17a>
    1736:	00b78123          	sb	a1,2(a5)
    173a:	0037069b          	addiw	a3,a4,3
    173e:	06c6ff63          	bleu	a2,a3,17bc <memset+0x17a>
    1742:	00b781a3          	sb	a1,3(a5)
    1746:	0047069b          	addiw	a3,a4,4
    174a:	06c6f963          	bleu	a2,a3,17bc <memset+0x17a>
    174e:	00b78223          	sb	a1,4(a5)
    1752:	0057069b          	addiw	a3,a4,5
    1756:	06c6f363          	bleu	a2,a3,17bc <memset+0x17a>
    175a:	00b782a3          	sb	a1,5(a5)
    175e:	0067069b          	addiw	a3,a4,6
    1762:	04c6fd63          	bleu	a2,a3,17bc <memset+0x17a>
    1766:	00b78323          	sb	a1,6(a5)
    176a:	0077069b          	addiw	a3,a4,7
    176e:	04c6f763          	bleu	a2,a3,17bc <memset+0x17a>
    1772:	00b783a3          	sb	a1,7(a5)
    1776:	0087069b          	addiw	a3,a4,8
    177a:	04c6f163          	bleu	a2,a3,17bc <memset+0x17a>
    177e:	00b78423          	sb	a1,8(a5)
    1782:	0097069b          	addiw	a3,a4,9
    1786:	02c6fb63          	bleu	a2,a3,17bc <memset+0x17a>
    178a:	00b784a3          	sb	a1,9(a5)
    178e:	00a7069b          	addiw	a3,a4,10
    1792:	02c6f563          	bleu	a2,a3,17bc <memset+0x17a>
    1796:	00b78523          	sb	a1,10(a5)
    179a:	00b7069b          	addiw	a3,a4,11
    179e:	00c6ff63          	bleu	a2,a3,17bc <memset+0x17a>
    17a2:	00b785a3          	sb	a1,11(a5)
    17a6:	00c7069b          	addiw	a3,a4,12
    17aa:	00c6f963          	bleu	a2,a3,17bc <memset+0x17a>
    17ae:	00b78623          	sb	a1,12(a5)
    17b2:	2735                	addiw	a4,a4,13
    17b4:	00c77463          	bleu	a2,a4,17bc <memset+0x17a>
    17b8:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17bc:	8082                	ret
    17be:	472d                	li	a4,11
    17c0:	bd79                	j	165e <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17c2:	4f0d                	li	t5,3
    17c4:	b701                	j	16c4 <memset+0x82>
    17c6:	8082                	ret
    17c8:	4f05                	li	t5,1
    17ca:	bded                	j	16c4 <memset+0x82>
    17cc:	8eaa                	mv	t4,a0
    17ce:	4f01                	li	t5,0
    17d0:	bdd5                	j	16c4 <memset+0x82>
    17d2:	87aa                	mv	a5,a0
    17d4:	4701                	li	a4,0
    17d6:	b7a1                	j	171e <memset+0xdc>
    17d8:	4f09                	li	t5,2
    17da:	b5ed                	j	16c4 <memset+0x82>
    17dc:	4f11                	li	t5,4
    17de:	b5dd                	j	16c4 <memset+0x82>
    17e0:	4f15                	li	t5,5
    17e2:	b5cd                	j	16c4 <memset+0x82>
    17e4:	4f19                	li	t5,6
    17e6:	bdf9                	j	16c4 <memset+0x82>

00000000000017e8 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e8:	00054703          	lbu	a4,0(a0)
    17ec:	0005c783          	lbu	a5,0(a1)
    17f0:	00e79b63          	bne	a5,a4,1806 <strcmp+0x1e>
    17f4:	cf89                	beqz	a5,180e <strcmp+0x26>
    17f6:	0505                	addi	a0,a0,1
    17f8:	0585                	addi	a1,a1,1
    17fa:	0005c783          	lbu	a5,0(a1)
    17fe:	00054703          	lbu	a4,0(a0)
    1802:	fef709e3          	beq	a4,a5,17f4 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1806:	0007051b          	sext.w	a0,a4
}
    180a:	9d1d                	subw	a0,a0,a5
    180c:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    180e:	4501                	li	a0,0
}
    1810:	9d1d                	subw	a0,a0,a5
    1812:	8082                	ret

0000000000001814 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1814:	c231                	beqz	a2,1858 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1816:	00054783          	lbu	a5,0(a0)
    181a:	0005c683          	lbu	a3,0(a1)
    181e:	c795                	beqz	a5,184a <strncmp+0x36>
    1820:	ca85                	beqz	a3,1850 <strncmp+0x3c>
    if (!n--)
    1822:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1824:	c615                	beqz	a2,1850 <strncmp+0x3c>
    1826:	00150713          	addi	a4,a0,1
    182a:	9532                	add	a0,a0,a2
    182c:	00d78963          	beq	a5,a3,183e <strncmp+0x2a>
    1830:	a005                	j	1850 <strncmp+0x3c>
    1832:	ce99                	beqz	a3,1850 <strncmp+0x3c>
    1834:	00e50e63          	beq	a0,a4,1850 <strncmp+0x3c>
    1838:	0705                	addi	a4,a4,1
    183a:	00d79b63          	bne	a5,a3,1850 <strncmp+0x3c>
    183e:	00074783          	lbu	a5,0(a4)
    1842:	0585                	addi	a1,a1,1
    1844:	0005c683          	lbu	a3,0(a1)
    1848:	f7ed                	bnez	a5,1832 <strncmp+0x1e>
    184a:	4501                	li	a0,0
        ;
    return *l - *r;
    184c:	9d15                	subw	a0,a0,a3
    184e:	8082                	ret
    1850:	0007851b          	sext.w	a0,a5
    1854:	9d15                	subw	a0,a0,a3
    1856:	8082                	ret
        return 0;
    1858:	4501                	li	a0,0
}
    185a:	8082                	ret

000000000000185c <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    185c:	00757793          	andi	a5,a0,7
    1860:	cfa1                	beqz	a5,18b8 <strlen+0x5c>
        if (!*s)
    1862:	00054783          	lbu	a5,0(a0)
    1866:	cbb9                	beqz	a5,18bc <strlen+0x60>
    1868:	87aa                	mv	a5,a0
    186a:	a021                	j	1872 <strlen+0x16>
    186c:	0007c703          	lbu	a4,0(a5)
    1870:	c329                	beqz	a4,18b2 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1872:	0785                	addi	a5,a5,1
    1874:	0077f713          	andi	a4,a5,7
    1878:	fb75                	bnez	a4,186c <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    187a:	00000717          	auipc	a4,0x0
    187e:	7d670713          	addi	a4,a4,2006 # 2050 <__clone+0x9e>
    1882:	630c                	ld	a1,0(a4)
    1884:	00000717          	auipc	a4,0x0
    1888:	7d470713          	addi	a4,a4,2004 # 2058 <__clone+0xa6>
    188c:	6394                	ld	a3,0(a5)
    188e:	6310                	ld	a2,0(a4)
    1890:	a019                	j	1896 <strlen+0x3a>
    1892:	07a1                	addi	a5,a5,8
    1894:	6394                	ld	a3,0(a5)
    1896:	00b68733          	add	a4,a3,a1
    189a:	fff6c693          	not	a3,a3
    189e:	8f75                	and	a4,a4,a3
    18a0:	8f71                	and	a4,a4,a2
    18a2:	db65                	beqz	a4,1892 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18a4:	0007c703          	lbu	a4,0(a5)
    18a8:	c709                	beqz	a4,18b2 <strlen+0x56>
    18aa:	0785                	addi	a5,a5,1
    18ac:	0007c703          	lbu	a4,0(a5)
    18b0:	ff6d                	bnez	a4,18aa <strlen+0x4e>
        ;
    return s - a;
    18b2:	40a78533          	sub	a0,a5,a0
}
    18b6:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b8:	87aa                	mv	a5,a0
    18ba:	b7c1                	j	187a <strlen+0x1e>
        if (!*s)
    18bc:	4501                	li	a0,0
            return s - a;
    18be:	8082                	ret

00000000000018c0 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c0:	00757793          	andi	a5,a0,7
    18c4:	0ff5f593          	andi	a1,a1,255
    18c8:	cb99                	beqz	a5,18de <memchr+0x1e>
    18ca:	c655                	beqz	a2,1976 <memchr+0xb6>
    18cc:	00054783          	lbu	a5,0(a0)
    18d0:	0ab78663          	beq	a5,a1,197c <memchr+0xbc>
    18d4:	0505                	addi	a0,a0,1
    18d6:	00757793          	andi	a5,a0,7
    18da:	167d                	addi	a2,a2,-1
    18dc:	f7fd                	bnez	a5,18ca <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18de:	4701                	li	a4,0
    if (n && *s != c)
    18e0:	ca49                	beqz	a2,1972 <memchr+0xb2>
    18e2:	00054783          	lbu	a5,0(a0)
    18e6:	08b78b63          	beq	a5,a1,197c <memchr+0xbc>
        size_t k = ONES * c;
    18ea:	00000797          	auipc	a5,0x0
    18ee:	77678793          	addi	a5,a5,1910 # 2060 <__clone+0xae>
    18f2:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f4:	479d                	li	a5,7
        size_t k = ONES * c;
    18f6:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fa:	08c7f863          	bleu	a2,a5,198a <memchr+0xca>
    18fe:	611c                	ld	a5,0(a0)
    1900:	00000317          	auipc	t1,0x0
    1904:	75830313          	addi	t1,t1,1880 # 2058 <__clone+0xa6>
    1908:	00033803          	ld	a6,0(t1)
    190c:	00f8c7b3          	xor	a5,a7,a5
    1910:	fff7c713          	not	a4,a5
    1914:	8f95                	sub	a5,a5,a3
    1916:	8ff9                	and	a5,a5,a4
    1918:	0107f7b3          	and	a5,a5,a6
    191c:	e7bd                	bnez	a5,198a <memchr+0xca>
    191e:	4e1d                	li	t3,7
    1920:	00000e97          	auipc	t4,0x0
    1924:	730e8e93          	addi	t4,t4,1840 # 2050 <__clone+0x9e>
    1928:	a005                	j	1948 <memchr+0x88>
    192a:	6514                	ld	a3,8(a0)
    192c:	000eb783          	ld	a5,0(t4)
    1930:	00033803          	ld	a6,0(t1)
    1934:	00d8c6b3          	xor	a3,a7,a3
    1938:	97b6                	add	a5,a5,a3
    193a:	fff6c693          	not	a3,a3
    193e:	8ff5                	and	a5,a5,a3
    1940:	0107f7b3          	and	a5,a5,a6
    1944:	e3a1                	bnez	a5,1984 <memchr+0xc4>
    1946:	853a                	mv	a0,a4
    1948:	1661                	addi	a2,a2,-8
    194a:	00850713          	addi	a4,a0,8
    194e:	fcce6ee3          	bltu	t3,a2,192a <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1952:	c215                	beqz	a2,1976 <memchr+0xb6>
    1954:	00074783          	lbu	a5,0(a4)
    1958:	00f58d63          	beq	a1,a5,1972 <memchr+0xb2>
    195c:	00170793          	addi	a5,a4,1
    1960:	963a                	add	a2,a2,a4
    1962:	873e                	mv	a4,a5
    1964:	00f60963          	beq	a2,a5,1976 <memchr+0xb6>
    1968:	0007c683          	lbu	a3,0(a5)
    196c:	0785                	addi	a5,a5,1
    196e:	feb69ae3          	bne	a3,a1,1962 <memchr+0xa2>
}
    1972:	853a                	mv	a0,a4
    1974:	8082                	ret
    return n ? (void *)s : 0;
    1976:	4701                	li	a4,0
}
    1978:	853a                	mv	a0,a4
    197a:	8082                	ret
    197c:	872a                	mv	a4,a0
    197e:	00074783          	lbu	a5,0(a4)
    1982:	bfd9                	j	1958 <memchr+0x98>
    1984:	00854783          	lbu	a5,8(a0)
    1988:	bfc1                	j	1958 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    198a:	872a                	mv	a4,a0
    198c:	bfc1                	j	195c <memchr+0x9c>

000000000000198e <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    198e:	00757793          	andi	a5,a0,7
    1992:	cfc5                	beqz	a5,1a4a <strnlen+0xbc>
    1994:	c1c5                	beqz	a1,1a34 <strnlen+0xa6>
    1996:	00054783          	lbu	a5,0(a0)
    199a:	cfd9                	beqz	a5,1a38 <strnlen+0xaa>
    199c:	87ae                	mv	a5,a1
    199e:	86aa                	mv	a3,a0
    19a0:	a029                	j	19aa <strnlen+0x1c>
    19a2:	cbc9                	beqz	a5,1a34 <strnlen+0xa6>
    19a4:	0006c703          	lbu	a4,0(a3)
    19a8:	cb51                	beqz	a4,1a3c <strnlen+0xae>
    19aa:	0685                	addi	a3,a3,1
    19ac:	0076f713          	andi	a4,a3,7
    19b0:	17fd                	addi	a5,a5,-1
    19b2:	fb65                	bnez	a4,19a2 <strnlen+0x14>
    if (n && *s != c)
    19b4:	c3c1                	beqz	a5,1a34 <strnlen+0xa6>
    19b6:	0006c703          	lbu	a4,0(a3)
    19ba:	c349                	beqz	a4,1a3c <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19bc:	471d                	li	a4,7
    19be:	08f77a63          	bleu	a5,a4,1a52 <strnlen+0xc4>
    19c2:	00000e17          	auipc	t3,0x0
    19c6:	68ee0e13          	addi	t3,t3,1678 # 2050 <__clone+0x9e>
    19ca:	6290                	ld	a2,0(a3)
    19cc:	000e3703          	ld	a4,0(t3)
    19d0:	00000e97          	auipc	t4,0x0
    19d4:	688e8e93          	addi	t4,t4,1672 # 2058 <__clone+0xa6>
    19d8:	000eb803          	ld	a6,0(t4)
    19dc:	9732                	add	a4,a4,a2
    19de:	fff64613          	not	a2,a2
    19e2:	8f71                	and	a4,a4,a2
    19e4:	01077733          	and	a4,a4,a6
    19e8:	e72d                	bnez	a4,1a52 <strnlen+0xc4>
    19ea:	4f1d                	li	t5,7
    19ec:	a839                	j	1a0a <strnlen+0x7c>
    19ee:	6698                	ld	a4,8(a3)
    19f0:	000e3303          	ld	t1,0(t3)
    19f4:	000eb803          	ld	a6,0(t4)
    19f8:	fff74893          	not	a7,a4
    19fc:	971a                	add	a4,a4,t1
    19fe:	01177733          	and	a4,a4,a7
    1a02:	01077733          	and	a4,a4,a6
    1a06:	ef1d                	bnez	a4,1a44 <strnlen+0xb6>
    1a08:	86b2                	mv	a3,a2
    1a0a:	17e1                	addi	a5,a5,-8
    1a0c:	00868613          	addi	a2,a3,8
    1a10:	fcff6fe3          	bltu	t5,a5,19ee <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a14:	c385                	beqz	a5,1a34 <strnlen+0xa6>
    1a16:	00064703          	lbu	a4,0(a2)
    1a1a:	cb19                	beqz	a4,1a30 <strnlen+0xa2>
    1a1c:	00160713          	addi	a4,a2,1
    1a20:	97b2                	add	a5,a5,a2
    1a22:	863a                	mv	a2,a4
    1a24:	00e78863          	beq	a5,a4,1a34 <strnlen+0xa6>
    1a28:	0705                	addi	a4,a4,1
    1a2a:	fff74683          	lbu	a3,-1(a4)
    1a2e:	faf5                	bnez	a3,1a22 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a30:	40a605b3          	sub	a1,a2,a0
}
    1a34:	852e                	mv	a0,a1
    1a36:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a38:	87ae                	mv	a5,a1
    1a3a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a3c:	8636                	mv	a2,a3
    1a3e:	00064703          	lbu	a4,0(a2)
    1a42:	bfe1                	j	1a1a <strnlen+0x8c>
    1a44:	0086c703          	lbu	a4,8(a3)
    1a48:	bfc9                	j	1a1a <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a4a:	87ae                	mv	a5,a1
    1a4c:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a4e:	f7a5                	bnez	a5,19b6 <strnlen+0x28>
    1a50:	b7d5                	j	1a34 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a52:	8636                	mv	a2,a3
    1a54:	b7e1                	j	1a1c <strnlen+0x8e>

0000000000001a56 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a56:	00b547b3          	xor	a5,a0,a1
    1a5a:	8b9d                	andi	a5,a5,7
    1a5c:	efa9                	bnez	a5,1ab6 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a5e:	0075f793          	andi	a5,a1,7
    1a62:	c38d                	beqz	a5,1a84 <strcpy+0x2e>
            if (!(*d = *s))
    1a64:	0005c783          	lbu	a5,0(a1)
    1a68:	00f50023          	sb	a5,0(a0)
    1a6c:	e799                	bnez	a5,1a7a <strcpy+0x24>
    1a6e:	a095                	j	1ad2 <strcpy+0x7c>
    1a70:	0005c783          	lbu	a5,0(a1)
    1a74:	00f50023          	sb	a5,0(a0)
    1a78:	cbb9                	beqz	a5,1ace <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a7a:	0585                	addi	a1,a1,1
    1a7c:	0075f793          	andi	a5,a1,7
    1a80:	0505                	addi	a0,a0,1
    1a82:	f7fd                	bnez	a5,1a70 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a84:	00000797          	auipc	a5,0x0
    1a88:	5cc78793          	addi	a5,a5,1484 # 2050 <__clone+0x9e>
    1a8c:	0007b803          	ld	a6,0(a5)
    1a90:	00000797          	auipc	a5,0x0
    1a94:	5c878793          	addi	a5,a5,1480 # 2058 <__clone+0xa6>
    1a98:	6198                	ld	a4,0(a1)
    1a9a:	6390                	ld	a2,0(a5)
    1a9c:	a031                	j	1aa8 <strcpy+0x52>
    1a9e:	0521                	addi	a0,a0,8
    1aa0:	05a1                	addi	a1,a1,8
    1aa2:	fee53c23          	sd	a4,-8(a0)
    1aa6:	6198                	ld	a4,0(a1)
    1aa8:	010707b3          	add	a5,a4,a6
    1aac:	fff74693          	not	a3,a4
    1ab0:	8ff5                	and	a5,a5,a3
    1ab2:	8ff1                	and	a5,a5,a2
    1ab4:	d7ed                	beqz	a5,1a9e <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ab6:	0005c783          	lbu	a5,0(a1)
    1aba:	00f50023          	sb	a5,0(a0)
    1abe:	cb89                	beqz	a5,1ad0 <strcpy+0x7a>
    1ac0:	0585                	addi	a1,a1,1
    1ac2:	0005c783          	lbu	a5,0(a1)
    1ac6:	0505                	addi	a0,a0,1
    1ac8:	00f50023          	sb	a5,0(a0)
    1acc:	fbf5                	bnez	a5,1ac0 <strcpy+0x6a>
        ;
    return d;
}
    1ace:	8082                	ret
    1ad0:	8082                	ret
    1ad2:	8082                	ret

0000000000001ad4 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ad4:	00b547b3          	xor	a5,a0,a1
    1ad8:	8b9d                	andi	a5,a5,7
    1ada:	ebc1                	bnez	a5,1b6a <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1adc:	0075f793          	andi	a5,a1,7
    1ae0:	cf91                	beqz	a5,1afc <strncpy+0x28>
    1ae2:	20060e63          	beqz	a2,1cfe <strncpy+0x22a>
    1ae6:	0005c783          	lbu	a5,0(a1)
    1aea:	00f50023          	sb	a5,0(a0)
    1aee:	c3d5                	beqz	a5,1b92 <strncpy+0xbe>
    1af0:	0585                	addi	a1,a1,1
    1af2:	0075f793          	andi	a5,a1,7
    1af6:	167d                	addi	a2,a2,-1
    1af8:	0505                	addi	a0,a0,1
    1afa:	f7e5                	bnez	a5,1ae2 <strncpy+0xe>
            ;
        if (!n || !*s)
    1afc:	20060163          	beqz	a2,1cfe <strncpy+0x22a>
    1b00:	0005c683          	lbu	a3,0(a1)
    1b04:	c6d9                	beqz	a3,1b92 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b06:	479d                	li	a5,7
    1b08:	22c7f563          	bleu	a2,a5,1d32 <strncpy+0x25e>
    1b0c:	00000317          	auipc	t1,0x0
    1b10:	54430313          	addi	t1,t1,1348 # 2050 <__clone+0x9e>
    1b14:	6198                	ld	a4,0(a1)
    1b16:	00033783          	ld	a5,0(t1)
    1b1a:	00000e17          	auipc	t3,0x0
    1b1e:	53ee0e13          	addi	t3,t3,1342 # 2058 <__clone+0xa6>
    1b22:	000e3803          	ld	a6,0(t3)
    1b26:	97ba                	add	a5,a5,a4
    1b28:	fff74893          	not	a7,a4
    1b2c:	0117f7b3          	and	a5,a5,a7
    1b30:	0107f7b3          	and	a5,a5,a6
    1b34:	1e079f63          	bnez	a5,1d32 <strncpy+0x25e>
    1b38:	4e9d                	li	t4,7
    1b3a:	a005                	j	1b5a <strncpy+0x86>
    1b3c:	6598                	ld	a4,8(a1)
    1b3e:	00033783          	ld	a5,0(t1)
    1b42:	000e3803          	ld	a6,0(t3)
    1b46:	fff74893          	not	a7,a4
    1b4a:	97ba                	add	a5,a5,a4
    1b4c:	0117f7b3          	and	a5,a5,a7
    1b50:	0107f7b3          	and	a5,a5,a6
    1b54:	1a079f63          	bnez	a5,1d12 <strncpy+0x23e>
    1b58:	85b6                	mv	a1,a3
            *wd = *ws;
    1b5a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b5c:	1661                	addi	a2,a2,-8
    1b5e:	00858693          	addi	a3,a1,8
    1b62:	0521                	addi	a0,a0,8
    1b64:	fcceece3          	bltu	t4,a2,1b3c <strncpy+0x68>
    1b68:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b6a:	18060a63          	beqz	a2,1cfe <strncpy+0x22a>
    1b6e:	0005c783          	lbu	a5,0(a1)
    1b72:	872a                	mv	a4,a0
    1b74:	00f50023          	sb	a5,0(a0)
    1b78:	e799                	bnez	a5,1b86 <strncpy+0xb2>
    1b7a:	a829                	j	1b94 <strncpy+0xc0>
    1b7c:	0005c783          	lbu	a5,0(a1)
    1b80:	00f70023          	sb	a5,0(a4)
    1b84:	cb81                	beqz	a5,1b94 <strncpy+0xc0>
    1b86:	167d                	addi	a2,a2,-1
    1b88:	0585                	addi	a1,a1,1
    1b8a:	0705                	addi	a4,a4,1
    1b8c:	fa65                	bnez	a2,1b7c <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b8e:	853a                	mv	a0,a4
    1b90:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b92:	872a                	mv	a4,a0
    1b94:	4805                	li	a6,1
    1b96:	14061c63          	bnez	a2,1cee <strncpy+0x21a>
    1b9a:	40e007b3          	neg	a5,a4
    1b9e:	8b9d                	andi	a5,a5,7
    1ba0:	4581                	li	a1,0
    1ba2:	12061e63          	bnez	a2,1cde <strncpy+0x20a>
    1ba6:	00778693          	addi	a3,a5,7
    1baa:	452d                	li	a0,11
    1bac:	12a6e763          	bltu	a3,a0,1cda <strncpy+0x206>
    1bb0:	16d5e663          	bltu	a1,a3,1d1c <strncpy+0x248>
    1bb4:	14078c63          	beqz	a5,1d0c <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb8:	00070023          	sb	zero,0(a4)
    1bbc:	4585                	li	a1,1
    1bbe:	00170693          	addi	a3,a4,1
    1bc2:	14b78363          	beq	a5,a1,1d08 <strncpy+0x234>
    1bc6:	000700a3          	sb	zero,1(a4)
    1bca:	4589                	li	a1,2
    1bcc:	00270693          	addi	a3,a4,2
    1bd0:	14b78963          	beq	a5,a1,1d22 <strncpy+0x24e>
    1bd4:	00070123          	sb	zero,2(a4)
    1bd8:	458d                	li	a1,3
    1bda:	00370693          	addi	a3,a4,3
    1bde:	12b78363          	beq	a5,a1,1d04 <strncpy+0x230>
    1be2:	000701a3          	sb	zero,3(a4)
    1be6:	4591                	li	a1,4
    1be8:	00470693          	addi	a3,a4,4
    1bec:	12b78d63          	beq	a5,a1,1d26 <strncpy+0x252>
    1bf0:	00070223          	sb	zero,4(a4)
    1bf4:	4595                	li	a1,5
    1bf6:	00570693          	addi	a3,a4,5
    1bfa:	12b78863          	beq	a5,a1,1d2a <strncpy+0x256>
    1bfe:	000702a3          	sb	zero,5(a4)
    1c02:	459d                	li	a1,7
    1c04:	00670693          	addi	a3,a4,6
    1c08:	12b79363          	bne	a5,a1,1d2e <strncpy+0x25a>
    1c0c:	00770693          	addi	a3,a4,7
    1c10:	00070323          	sb	zero,6(a4)
    1c14:	40f80833          	sub	a6,a6,a5
    1c18:	ff887513          	andi	a0,a6,-8
    1c1c:	97ba                	add	a5,a5,a4
    1c1e:	953e                	add	a0,a0,a5
    1c20:	0007b023          	sd	zero,0(a5)
    1c24:	07a1                	addi	a5,a5,8
    1c26:	fea79de3          	bne	a5,a0,1c20 <strncpy+0x14c>
    1c2a:	ff887513          	andi	a0,a6,-8
    1c2e:	9da9                	addw	a1,a1,a0
    1c30:	00a687b3          	add	a5,a3,a0
    1c34:	f4a80de3          	beq	a6,a0,1b8e <strncpy+0xba>
    1c38:	00078023          	sb	zero,0(a5)
    1c3c:	0015869b          	addiw	a3,a1,1
    1c40:	f4c6f7e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c44:	000780a3          	sb	zero,1(a5)
    1c48:	0025869b          	addiw	a3,a1,2
    1c4c:	f4c6f1e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c50:	00078123          	sb	zero,2(a5)
    1c54:	0035869b          	addiw	a3,a1,3
    1c58:	f2c6fbe3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c5c:	000781a3          	sb	zero,3(a5)
    1c60:	0045869b          	addiw	a3,a1,4
    1c64:	f2c6f5e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c68:	00078223          	sb	zero,4(a5)
    1c6c:	0055869b          	addiw	a3,a1,5
    1c70:	f0c6ffe3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c74:	000782a3          	sb	zero,5(a5)
    1c78:	0065869b          	addiw	a3,a1,6
    1c7c:	f0c6f9e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c80:	00078323          	sb	zero,6(a5)
    1c84:	0075869b          	addiw	a3,a1,7
    1c88:	f0c6f3e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c8c:	000783a3          	sb	zero,7(a5)
    1c90:	0085869b          	addiw	a3,a1,8
    1c94:	eec6fde3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1c98:	00078423          	sb	zero,8(a5)
    1c9c:	0095869b          	addiw	a3,a1,9
    1ca0:	eec6f7e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1ca4:	000784a3          	sb	zero,9(a5)
    1ca8:	00a5869b          	addiw	a3,a1,10
    1cac:	eec6f1e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1cb0:	00078523          	sb	zero,10(a5)
    1cb4:	00b5869b          	addiw	a3,a1,11
    1cb8:	ecc6fbe3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1cbc:	000785a3          	sb	zero,11(a5)
    1cc0:	00c5869b          	addiw	a3,a1,12
    1cc4:	ecc6f5e3          	bleu	a2,a3,1b8e <strncpy+0xba>
    1cc8:	00078623          	sb	zero,12(a5)
    1ccc:	25b5                	addiw	a1,a1,13
    1cce:	ecc5f0e3          	bleu	a2,a1,1b8e <strncpy+0xba>
    1cd2:	000786a3          	sb	zero,13(a5)
}
    1cd6:	853a                	mv	a0,a4
    1cd8:	8082                	ret
    1cda:	46ad                	li	a3,11
    1cdc:	bdd1                	j	1bb0 <strncpy+0xdc>
    1cde:	00778693          	addi	a3,a5,7
    1ce2:	452d                	li	a0,11
    1ce4:	fff60593          	addi	a1,a2,-1
    1ce8:	eca6f4e3          	bleu	a0,a3,1bb0 <strncpy+0xdc>
    1cec:	b7fd                	j	1cda <strncpy+0x206>
    1cee:	40e007b3          	neg	a5,a4
    1cf2:	8832                	mv	a6,a2
    1cf4:	8b9d                	andi	a5,a5,7
    1cf6:	4581                	li	a1,0
    1cf8:	ea0607e3          	beqz	a2,1ba6 <strncpy+0xd2>
    1cfc:	b7cd                	j	1cde <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cfe:	872a                	mv	a4,a0
}
    1d00:	853a                	mv	a0,a4
    1d02:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d04:	458d                	li	a1,3
    1d06:	b739                	j	1c14 <strncpy+0x140>
    1d08:	4585                	li	a1,1
    1d0a:	b729                	j	1c14 <strncpy+0x140>
    1d0c:	86ba                	mv	a3,a4
    1d0e:	4581                	li	a1,0
    1d10:	b711                	j	1c14 <strncpy+0x140>
    1d12:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d16:	872a                	mv	a4,a0
    1d18:	85b6                	mv	a1,a3
    1d1a:	bda9                	j	1b74 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d1c:	87ba                	mv	a5,a4
    1d1e:	4581                	li	a1,0
    1d20:	bf21                	j	1c38 <strncpy+0x164>
    1d22:	4589                	li	a1,2
    1d24:	bdc5                	j	1c14 <strncpy+0x140>
    1d26:	4591                	li	a1,4
    1d28:	b5f5                	j	1c14 <strncpy+0x140>
    1d2a:	4595                	li	a1,5
    1d2c:	b5e5                	j	1c14 <strncpy+0x140>
    1d2e:	4599                	li	a1,6
    1d30:	b5d5                	j	1c14 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d32:	00d50023          	sb	a3,0(a0)
    1d36:	872a                	mv	a4,a0
    1d38:	b5b9                	j	1b86 <strncpy+0xb2>

0000000000001d3a <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d3a:	87aa                	mv	a5,a0
    1d3c:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d3e:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d42:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d46:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d48:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d4a:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d4e:	2501                	sext.w	a0,a0
    1d50:	8082                	ret

0000000000001d52 <openat>:
    register long a7 __asm__("a7") = n;
    1d52:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d56:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5a:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d5e:	2501                	sext.w	a0,a0
    1d60:	8082                	ret

0000000000001d62 <close>:
    register long a7 __asm__("a7") = n;
    1d62:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d66:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <read>:
    register long a7 __asm__("a7") = n;
    1d6e:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d72:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d76:	8082                	ret

0000000000001d78 <write>:
    register long a7 __asm__("a7") = n;
    1d78:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7c:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d80:	8082                	ret

0000000000001d82 <getpid>:
    register long a7 __asm__("a7") = n;
    1d82:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d86:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d8a:	2501                	sext.w	a0,a0
    1d8c:	8082                	ret

0000000000001d8e <getppid>:
    register long a7 __asm__("a7") = n;
    1d8e:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d92:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d96:	2501                	sext.w	a0,a0
    1d98:	8082                	ret

0000000000001d9a <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d9a:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d9e:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1da2:	2501                	sext.w	a0,a0
    1da4:	8082                	ret

0000000000001da6 <fork>:
    register long a7 __asm__("a7") = n;
    1da6:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1daa:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dac:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dae:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1db2:	2501                	sext.w	a0,a0
    1db4:	8082                	ret

0000000000001db6 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1db6:	85b2                	mv	a1,a2
    1db8:	863a                	mv	a2,a4
    if (stack)
    1dba:	c191                	beqz	a1,1dbe <clone+0x8>
	stack += stack_size;
    1dbc:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dbe:	4781                	li	a5,0
    1dc0:	4701                	li	a4,0
    1dc2:	4681                	li	a3,0
    1dc4:	2601                	sext.w	a2,a2
    1dc6:	1ec0006f          	j	1fb2 <__clone>

0000000000001dca <exit>:
    register long a7 __asm__("a7") = n;
    1dca:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dce:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dd2:	8082                	ret

0000000000001dd4 <waitpid>:
    register long a7 __asm__("a7") = n;
    1dd4:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dd8:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dda:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dde:	2501                	sext.w	a0,a0
    1de0:	8082                	ret

0000000000001de2 <exec>:
    register long a7 __asm__("a7") = n;
    1de2:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1de6:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dea:	2501                	sext.w	a0,a0
    1dec:	8082                	ret

0000000000001dee <execve>:
    register long a7 __asm__("a7") = n;
    1dee:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1df2:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1df6:	2501                	sext.w	a0,a0
    1df8:	8082                	ret

0000000000001dfa <times>:
    register long a7 __asm__("a7") = n;
    1dfa:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1dfe:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e02:	2501                	sext.w	a0,a0
    1e04:	8082                	ret

0000000000001e06 <get_time>:

int64 get_time()
{
    1e06:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e08:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e0c:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e0e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e10:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e14:	2501                	sext.w	a0,a0
    1e16:	ed09                	bnez	a0,1e30 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e18:	67a2                	ld	a5,8(sp)
    1e1a:	3e800713          	li	a4,1000
    1e1e:	00015503          	lhu	a0,0(sp)
    1e22:	02e7d7b3          	divu	a5,a5,a4
    1e26:	02e50533          	mul	a0,a0,a4
    1e2a:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e2c:	0141                	addi	sp,sp,16
    1e2e:	8082                	ret
        return -1;
    1e30:	557d                	li	a0,-1
    1e32:	bfed                	j	1e2c <get_time+0x26>

0000000000001e34 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e34:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e38:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e3c:	2501                	sext.w	a0,a0
    1e3e:	8082                	ret

0000000000001e40 <time>:
    register long a7 __asm__("a7") = n;
    1e40:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e44:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e48:	2501                	sext.w	a0,a0
    1e4a:	8082                	ret

0000000000001e4c <sleep>:

int sleep(unsigned long long time)
{
    1e4c:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e4e:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e50:	850a                	mv	a0,sp
    1e52:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e54:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e58:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e5a:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e5e:	e501                	bnez	a0,1e66 <sleep+0x1a>
    return 0;
    1e60:	4501                	li	a0,0
}
    1e62:	0141                	addi	sp,sp,16
    1e64:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e66:	4502                	lw	a0,0(sp)
}
    1e68:	0141                	addi	sp,sp,16
    1e6a:	8082                	ret

0000000000001e6c <set_priority>:
    register long a7 __asm__("a7") = n;
    1e6c:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e70:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e74:	2501                	sext.w	a0,a0
    1e76:	8082                	ret

0000000000001e78 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e78:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e7c:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e80:	8082                	ret

0000000000001e82 <munmap>:
    register long a7 __asm__("a7") = n;
    1e82:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e86:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e8a:	2501                	sext.w	a0,a0
    1e8c:	8082                	ret

0000000000001e8e <wait>:

int wait(int *code)
{
    1e8e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e90:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e94:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e96:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e98:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e9a:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e9e:	2501                	sext.w	a0,a0
    1ea0:	8082                	ret

0000000000001ea2 <spawn>:
    register long a7 __asm__("a7") = n;
    1ea2:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ea6:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <mailread>:
    register long a7 __asm__("a7") = n;
    1eae:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb2:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <mailwrite>:
    register long a7 __asm__("a7") = n;
    1eba:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ebe:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <fstat>:
    register long a7 __asm__("a7") = n;
    1ec6:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eca:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ece:	2501                	sext.w	a0,a0
    1ed0:	8082                	ret

0000000000001ed2 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ed2:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ed4:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ed8:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eda:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ede:	2501                	sext.w	a0,a0
    1ee0:	8082                	ret

0000000000001ee2 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ee2:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee4:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ee8:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eea:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1eee:	2501                	sext.w	a0,a0
    1ef0:	8082                	ret

0000000000001ef2 <link>:

int link(char *old_path, char *new_path)
{
    1ef2:	87aa                	mv	a5,a0
    1ef4:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1ef6:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1efa:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1efe:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f00:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f04:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f06:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <unlink>:

int unlink(char *path)
{
    1f0e:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f10:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f14:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f18:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1a:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f1e:	2501                	sext.w	a0,a0
    1f20:	8082                	ret

0000000000001f22 <uname>:
    register long a7 __asm__("a7") = n;
    1f22:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f26:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f2a:	2501                	sext.w	a0,a0
    1f2c:	8082                	ret

0000000000001f2e <brk>:
    register long a7 __asm__("a7") = n;
    1f2e:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f32:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f36:	2501                	sext.w	a0,a0
    1f38:	8082                	ret

0000000000001f3a <getcwd>:
    register long a7 __asm__("a7") = n;
    1f3a:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f3c:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f40:	8082                	ret

0000000000001f42 <chdir>:
    register long a7 __asm__("a7") = n;
    1f42:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f46:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f4a:	2501                	sext.w	a0,a0
    1f4c:	8082                	ret

0000000000001f4e <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f4e:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f50:	02059613          	slli	a2,a1,0x20
    1f54:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f56:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f5a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f5e:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f60:	00000073          	ecall
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <getdents>:
    register long a7 __asm__("a7") = n;
    1f68:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f6c:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f70:	2501                	sext.w	a0,a0
    1f72:	8082                	ret

0000000000001f74 <pipe>:
    register long a7 __asm__("a7") = n;
    1f74:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f78:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f7a:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f7e:	2501                	sext.w	a0,a0
    1f80:	8082                	ret

0000000000001f82 <dup>:
    register long a7 __asm__("a7") = n;
    1f82:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f84:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f88:	2501                	sext.w	a0,a0
    1f8a:	8082                	ret

0000000000001f8c <dup2>:
    register long a7 __asm__("a7") = n;
    1f8c:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f8e:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f90:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <mount>:
    register long a7 __asm__("a7") = n;
    1f98:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f9c:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fa0:	2501                	sext.w	a0,a0
    1fa2:	8082                	ret

0000000000001fa4 <umount>:
    register long a7 __asm__("a7") = n;
    1fa4:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fa8:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1faa:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fae:	2501                	sext.w	a0,a0
    1fb0:	8082                	ret

0000000000001fb2 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fb2:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fb4:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fb6:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fb8:	8532                	mv	a0,a2
	mv a2, a4
    1fba:	863a                	mv	a2,a4
	mv a3, a5
    1fbc:	86be                	mv	a3,a5
	mv a4, a6
    1fbe:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fc0:	0dc00893          	li	a7,220
	ecall
    1fc4:	00000073          	ecall

	beqz a0, 1f
    1fc8:	c111                	beqz	a0,1fcc <__clone+0x1a>
	# Parent
	ret
    1fca:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fcc:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fce:	6522                	ld	a0,8(sp)
	jalr a1
    1fd0:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fd2:	05d00893          	li	a7,93
	ecall
    1fd6:	00000073          	ecall
