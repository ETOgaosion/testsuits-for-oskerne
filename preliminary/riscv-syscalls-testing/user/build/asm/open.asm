
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/open:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0b20006f          	j	10b4 <__start_main>

0000000000001006 <test_open>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"

void test_open() {
    1006:	716d                	addi	sp,sp,-272
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fe850513          	addi	a0,a0,-24 # 1ff0 <__clone+0x2c>
void test_open() {
    1010:	e606                	sd	ra,264(sp)
    1012:	e222                	sd	s0,256(sp)
	TEST_START(__func__);
    1014:	2a0000ef          	jal	ra,12b4 <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	06050513          	addi	a0,a0,96 # 2078 <__func__.1185>
    1020:	294000ef          	jal	ra,12b4 <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fe450513          	addi	a0,a0,-28 # 2008 <__clone+0x44>
    102c:	288000ef          	jal	ra,12b4 <puts>
	// O_RDONLY = 0, O_WRONLY = 1
	int fd = open("./text.txt", 0);
    1030:	4581                	li	a1,0
    1032:	00001517          	auipc	a0,0x1
    1036:	fe650513          	addi	a0,a0,-26 # 2018 <__clone+0x54>
    103a:	513000ef          	jal	ra,1d4c <open>
    103e:	842a                	mv	s0,a0
	assert(fd >= 0);
    1040:	04054b63          	bltz	a0,1096 <test_open+0x90>
	char buf[256];
	int size = read(fd, buf, 256);
    1044:	858a                	mv	a1,sp
    1046:	10000613          	li	a2,256
    104a:	8522                	mv	a0,s0
    104c:	535000ef          	jal	ra,1d80 <read>
    1050:	2501                	sext.w	a0,a0
	if (size < 0) {
		size = 0;
	}
	write(STDOUT, buf, size);
    1052:	fff54613          	not	a2,a0
    1056:	967d                	srai	a2,a2,0x3f
    1058:	8e69                	and	a2,a2,a0
    105a:	858a                	mv	a1,sp
    105c:	2601                	sext.w	a2,a2
    105e:	4505                	li	a0,1
    1060:	52b000ef          	jal	ra,1d8a <write>
	close(fd);
    1064:	8522                	mv	a0,s0
    1066:	50f000ef          	jal	ra,1d74 <close>
	TEST_END(__func__);
    106a:	00001517          	auipc	a0,0x1
    106e:	fde50513          	addi	a0,a0,-34 # 2048 <__clone+0x84>
    1072:	242000ef          	jal	ra,12b4 <puts>
    1076:	00001517          	auipc	a0,0x1
    107a:	00250513          	addi	a0,a0,2 # 2078 <__func__.1185>
    107e:	236000ef          	jal	ra,12b4 <puts>
    1082:	00001517          	auipc	a0,0x1
    1086:	f8650513          	addi	a0,a0,-122 # 2008 <__clone+0x44>
    108a:	22a000ef          	jal	ra,12b4 <puts>
}
    108e:	60b2                	ld	ra,264(sp)
    1090:	6412                	ld	s0,256(sp)
    1092:	6151                	addi	sp,sp,272
    1094:	8082                	ret
	assert(fd >= 0);
    1096:	00001517          	auipc	a0,0x1
    109a:	f9250513          	addi	a0,a0,-110 # 2028 <__clone+0x64>
    109e:	4dc000ef          	jal	ra,157a <panic>
    10a2:	b74d                	j	1044 <test_open+0x3e>

00000000000010a4 <main>:

int main(void) {
    10a4:	1141                	addi	sp,sp,-16
    10a6:	e406                	sd	ra,8(sp)
	test_open();
    10a8:	f5fff0ef          	jal	ra,1006 <test_open>
	return 0;
}
    10ac:	60a2                	ld	ra,8(sp)
    10ae:	4501                	li	a0,0
    10b0:	0141                	addi	sp,sp,16
    10b2:	8082                	ret

00000000000010b4 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10b4:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10b6:	4108                	lw	a0,0(a0)
{
    10b8:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10ba:	05a1                	addi	a1,a1,8
{
    10bc:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10be:	fe7ff0ef          	jal	ra,10a4 <main>
    10c2:	51b000ef          	jal	ra,1ddc <exit>
	return 0;
}
    10c6:	60a2                	ld	ra,8(sp)
    10c8:	4501                	li	a0,0
    10ca:	0141                	addi	sp,sp,16
    10cc:	8082                	ret

00000000000010ce <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10ce:	7179                	addi	sp,sp,-48
    10d0:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10d2:	12054e63          	bltz	a0,120e <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10d6:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10da:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10dc:	02b7f6bb          	remuw	a3,a5,a1
    10e0:	00001717          	auipc	a4,0x1
    10e4:	fa870713          	addi	a4,a4,-88 # 2088 <digits>
    buf[16] = 0;
    10e8:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10ec:	1682                	slli	a3,a3,0x20
    10ee:	9281                	srli	a3,a3,0x20
    10f0:	96ba                	add	a3,a3,a4
    10f2:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10f6:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10fa:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10fe:	16b7e363          	bltu	a5,a1,1264 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1102:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1106:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    110a:	1602                	slli	a2,a2,0x20
    110c:	9201                	srli	a2,a2,0x20
    110e:	963a                	add	a2,a2,a4
    1110:	00064603          	lbu	a2,0(a2)
    1114:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1118:	0007861b          	sext.w	a2,a5
    111c:	12b6e863          	bltu	a3,a1,124c <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1120:	02b7f6bb          	remuw	a3,a5,a1
    1124:	1682                	slli	a3,a3,0x20
    1126:	9281                	srli	a3,a3,0x20
    1128:	96ba                	add	a3,a3,a4
    112a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    112e:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1132:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1136:	10b66e63          	bltu	a2,a1,1252 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    113a:	02b876bb          	remuw	a3,a6,a1
    113e:	1682                	slli	a3,a3,0x20
    1140:	9281                	srli	a3,a3,0x20
    1142:	96ba                	add	a3,a3,a4
    1144:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1148:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    114c:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1150:	10b86463          	bltu	a6,a1,1258 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1154:	02b676bb          	remuw	a3,a2,a1
    1158:	1682                	slli	a3,a3,0x20
    115a:	9281                	srli	a3,a3,0x20
    115c:	96ba                	add	a3,a3,a4
    115e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1162:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1166:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    116a:	0eb66a63          	bltu	a2,a1,125e <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    116e:	02b876bb          	remuw	a3,a6,a1
    1172:	1682                	slli	a3,a3,0x20
    1174:	9281                	srli	a3,a3,0x20
    1176:	96ba                	add	a3,a3,a4
    1178:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117c:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1180:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1184:	0cb86163          	bltu	a6,a1,1246 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1188:	02b676bb          	remuw	a3,a2,a1
    118c:	1682                	slli	a3,a3,0x20
    118e:	9281                	srli	a3,a3,0x20
    1190:	96ba                	add	a3,a3,a4
    1192:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1196:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    119a:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    119e:	0cb66563          	bltu	a2,a1,1268 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11a2:	02b876bb          	remuw	a3,a6,a1
    11a6:	1682                	slli	a3,a3,0x20
    11a8:	9281                	srli	a3,a3,0x20
    11aa:	96ba                	add	a3,a3,a4
    11ac:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b0:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11b4:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11b8:	0ab86b63          	bltu	a6,a1,126e <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11bc:	02b676bb          	remuw	a3,a2,a1
    11c0:	1682                	slli	a3,a3,0x20
    11c2:	9281                	srli	a3,a3,0x20
    11c4:	96ba                	add	a3,a3,a4
    11c6:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11ca:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11ce:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11d2:	0ab66163          	bltu	a2,a1,1274 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11d6:	1782                	slli	a5,a5,0x20
    11d8:	9381                	srli	a5,a5,0x20
    11da:	97ba                	add	a5,a5,a4
    11dc:	0007c703          	lbu	a4,0(a5)
    11e0:	4599                	li	a1,6
    11e2:	4795                	li	a5,5
    11e4:	00e10723          	sb	a4,14(sp)

    if (sign)
    11e8:	00055963          	bgez	a0,11fa <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11ec:	1018                	addi	a4,sp,32
    11ee:	973e                	add	a4,a4,a5
    11f0:	02d00693          	li	a3,45
    11f4:	fed70423          	sb	a3,-24(a4)
    11f8:	85be                	mv	a1,a5
    write(f, s, l);
    11fa:	003c                	addi	a5,sp,8
    11fc:	4641                	li	a2,16
    11fe:	9e0d                	subw	a2,a2,a1
    1200:	4505                	li	a0,1
    1202:	95be                	add	a1,a1,a5
    1204:	387000ef          	jal	ra,1d8a <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1208:	70a2                	ld	ra,40(sp)
    120a:	6145                	addi	sp,sp,48
    120c:	8082                	ret
        x = -xx;
    120e:	40a0063b          	negw	a2,a0
    1212:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1214:	02b677bb          	remuw	a5,a2,a1
    1218:	00001717          	auipc	a4,0x1
    121c:	e7070713          	addi	a4,a4,-400 # 2088 <digits>
    buf[16] = 0;
    1220:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1224:	1782                	slli	a5,a5,0x20
    1226:	9381                	srli	a5,a5,0x20
    1228:	97ba                	add	a5,a5,a4
    122a:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    122e:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1232:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1236:	ecb676e3          	bleu	a1,a2,1102 <printint.constprop.0+0x34>
        buf[i--] = '-';
    123a:	02d00793          	li	a5,45
    123e:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1242:	45b9                	li	a1,14
    1244:	bf5d                	j	11fa <printint.constprop.0+0x12c>
    1246:	47a5                	li	a5,9
    1248:	45a9                	li	a1,10
    124a:	bf79                	j	11e8 <printint.constprop.0+0x11a>
    124c:	47b5                	li	a5,13
    124e:	45b9                	li	a1,14
    1250:	bf61                	j	11e8 <printint.constprop.0+0x11a>
    1252:	47b1                	li	a5,12
    1254:	45b5                	li	a1,13
    1256:	bf49                	j	11e8 <printint.constprop.0+0x11a>
    1258:	47ad                	li	a5,11
    125a:	45b1                	li	a1,12
    125c:	b771                	j	11e8 <printint.constprop.0+0x11a>
    125e:	47a9                	li	a5,10
    1260:	45ad                	li	a1,11
    1262:	b759                	j	11e8 <printint.constprop.0+0x11a>
    i = 15;
    1264:	45bd                	li	a1,15
    1266:	bf51                	j	11fa <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1268:	47a1                	li	a5,8
    126a:	45a5                	li	a1,9
    126c:	bfb5                	j	11e8 <printint.constprop.0+0x11a>
    126e:	479d                	li	a5,7
    1270:	45a1                	li	a1,8
    1272:	bf9d                	j	11e8 <printint.constprop.0+0x11a>
    1274:	4799                	li	a5,6
    1276:	459d                	li	a1,7
    1278:	bf85                	j	11e8 <printint.constprop.0+0x11a>

000000000000127a <getchar>:
{
    127a:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    127c:	00f10593          	addi	a1,sp,15
    1280:	4605                	li	a2,1
    1282:	4501                	li	a0,0
{
    1284:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1286:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    128a:	2f7000ef          	jal	ra,1d80 <read>
}
    128e:	60e2                	ld	ra,24(sp)
    1290:	00f14503          	lbu	a0,15(sp)
    1294:	6105                	addi	sp,sp,32
    1296:	8082                	ret

0000000000001298 <putchar>:
{
    1298:	1101                	addi	sp,sp,-32
    char byte = c;
    129a:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    129e:	00f10593          	addi	a1,sp,15
    12a2:	4605                	li	a2,1
    12a4:	4505                	li	a0,1
{
    12a6:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12a8:	2e3000ef          	jal	ra,1d8a <write>
}
    12ac:	60e2                	ld	ra,24(sp)
    12ae:	2501                	sext.w	a0,a0
    12b0:	6105                	addi	sp,sp,32
    12b2:	8082                	ret

00000000000012b4 <puts>:
{
    12b4:	1141                	addi	sp,sp,-16
    12b6:	e406                	sd	ra,8(sp)
    12b8:	e022                	sd	s0,0(sp)
    12ba:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12bc:	5b2000ef          	jal	ra,186e <strlen>
    12c0:	862a                	mv	a2,a0
    12c2:	85a2                	mv	a1,s0
    12c4:	4505                	li	a0,1
    12c6:	2c5000ef          	jal	ra,1d8a <write>
}
    12ca:	60a2                	ld	ra,8(sp)
    12cc:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12ce:	957d                	srai	a0,a0,0x3f
    return r;
    12d0:	2501                	sext.w	a0,a0
}
    12d2:	0141                	addi	sp,sp,16
    12d4:	8082                	ret

00000000000012d6 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12d6:	7131                	addi	sp,sp,-192
    12d8:	e0da                	sd	s6,64(sp)
    12da:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12dc:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12de:	013c                	addi	a5,sp,136
{
    12e0:	f0ca                	sd	s2,96(sp)
    12e2:	ecce                	sd	s3,88(sp)
    12e4:	e8d2                	sd	s4,80(sp)
    12e6:	e4d6                	sd	s5,72(sp)
    12e8:	fc5e                	sd	s7,56(sp)
    12ea:	fc86                	sd	ra,120(sp)
    12ec:	f8a2                	sd	s0,112(sp)
    12ee:	f4a6                	sd	s1,104(sp)
    12f0:	89aa                	mv	s3,a0
    12f2:	e52e                	sd	a1,136(sp)
    12f4:	e932                	sd	a2,144(sp)
    12f6:	ed36                	sd	a3,152(sp)
    12f8:	f13a                	sd	a4,160(sp)
    12fa:	f942                	sd	a6,176(sp)
    12fc:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12fe:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    1300:	02500913          	li	s2,37
    1304:	07000a93          	li	s5,112
    buf[i++] = '0';
    1308:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    130c:	00001a17          	auipc	s4,0x1
    1310:	d7ca0a13          	addi	s4,s4,-644 # 2088 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1314:	00001b97          	auipc	s7,0x1
    1318:	d44b8b93          	addi	s7,s7,-700 # 2058 <__clone+0x94>
        if (!*s)
    131c:	0009c783          	lbu	a5,0(s3)
    1320:	cfb9                	beqz	a5,137e <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1322:	23278d63          	beq	a5,s2,155c <printf+0x286>
    1326:	864e                	mv	a2,s3
    1328:	a019                	j	132e <printf+0x58>
    132a:	07278563          	beq	a5,s2,1394 <printf+0xbe>
    132e:	0605                	addi	a2,a2,1
    1330:	00064783          	lbu	a5,0(a2)
    1334:	fbfd                	bnez	a5,132a <printf+0x54>
    1336:	84b2                	mv	s1,a2
        l = z - a;
    1338:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    133c:	8622                	mv	a2,s0
    133e:	85ce                	mv	a1,s3
    1340:	4505                	li	a0,1
    1342:	249000ef          	jal	ra,1d8a <write>
        if (l)
    1346:	ec3d                	bnez	s0,13c4 <printf+0xee>
        if (s[1] == 0)
    1348:	0014c783          	lbu	a5,1(s1)
    134c:	cb8d                	beqz	a5,137e <printf+0xa8>
        switch (s[1])
    134e:	09578b63          	beq	a5,s5,13e4 <printf+0x10e>
    1352:	06fafb63          	bleu	a5,s5,13c8 <printf+0xf2>
    1356:	07300713          	li	a4,115
    135a:	1ce78e63          	beq	a5,a4,1536 <printf+0x260>
    135e:	07800713          	li	a4,120
    1362:	1ae79563          	bne	a5,a4,150c <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1366:	6782                	ld	a5,0(sp)
    1368:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    136a:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    136e:	4388                	lw	a0,0(a5)
    1370:	07a1                	addi	a5,a5,8
    1372:	e03e                	sd	a5,0(sp)
    1374:	d5bff0ef          	jal	ra,10ce <printint.constprop.0>
        if (!*s)
    1378:	0009c783          	lbu	a5,0(s3)
    137c:	f3dd                	bnez	a5,1322 <printf+0x4c>
    }
    va_end(ap);
}
    137e:	70e6                	ld	ra,120(sp)
    1380:	7446                	ld	s0,112(sp)
    1382:	74a6                	ld	s1,104(sp)
    1384:	7906                	ld	s2,96(sp)
    1386:	69e6                	ld	s3,88(sp)
    1388:	6a46                	ld	s4,80(sp)
    138a:	6aa6                	ld	s5,72(sp)
    138c:	6b06                	ld	s6,64(sp)
    138e:	7be2                	ld	s7,56(sp)
    1390:	6129                	addi	sp,sp,192
    1392:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1394:	00164783          	lbu	a5,1(a2)
    1398:	84b2                	mv	s1,a2
    139a:	01278763          	beq	a5,s2,13a8 <printf+0xd2>
    139e:	bf69                	j	1338 <printf+0x62>
    13a0:	0014c783          	lbu	a5,1(s1)
    13a4:	f9279ae3          	bne	a5,s2,1338 <printf+0x62>
    13a8:	0489                	addi	s1,s1,2
    13aa:	0004c783          	lbu	a5,0(s1)
    13ae:	0605                	addi	a2,a2,1
    13b0:	ff2788e3          	beq	a5,s2,13a0 <printf+0xca>
        l = z - a;
    13b4:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13b8:	8622                	mv	a2,s0
    13ba:	85ce                	mv	a1,s3
    13bc:	4505                	li	a0,1
    13be:	1cd000ef          	jal	ra,1d8a <write>
        if (l)
    13c2:	d059                	beqz	s0,1348 <printf+0x72>
    13c4:	89a6                	mv	s3,s1
    13c6:	bf99                	j	131c <printf+0x46>
    13c8:	06400713          	li	a4,100
    13cc:	14e79063          	bne	a5,a4,150c <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13d0:	6782                	ld	a5,0(sp)
    13d2:	45a9                	li	a1,10
        s += 2;
    13d4:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13d8:	4388                	lw	a0,0(a5)
    13da:	07a1                	addi	a5,a5,8
    13dc:	e03e                	sd	a5,0(sp)
    13de:	cf1ff0ef          	jal	ra,10ce <printint.constprop.0>
        s += 2;
    13e2:	bf59                	j	1378 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13e4:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13e6:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13ea:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13ec:	631c                	ld	a5,0(a4)
    13ee:	0721                	addi	a4,a4,8
    13f0:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13f2:	00479293          	slli	t0,a5,0x4
    13f6:	00879f93          	slli	t6,a5,0x8
    13fa:	00c79f13          	slli	t5,a5,0xc
    13fe:	01079e93          	slli	t4,a5,0x10
    1402:	01479e13          	slli	t3,a5,0x14
    1406:	01879313          	slli	t1,a5,0x18
    140a:	01c79893          	slli	a7,a5,0x1c
    140e:	02479813          	slli	a6,a5,0x24
    1412:	02879513          	slli	a0,a5,0x28
    1416:	02c79593          	slli	a1,a5,0x2c
    141a:	03079693          	slli	a3,a5,0x30
    141e:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1422:	03c7d413          	srli	s0,a5,0x3c
    1426:	01c7d39b          	srliw	t2,a5,0x1c
    142a:	03c2d293          	srli	t0,t0,0x3c
    142e:	03cfdf93          	srli	t6,t6,0x3c
    1432:	03cf5f13          	srli	t5,t5,0x3c
    1436:	03cede93          	srli	t4,t4,0x3c
    143a:	03ce5e13          	srli	t3,t3,0x3c
    143e:	03c35313          	srli	t1,t1,0x3c
    1442:	03c8d893          	srli	a7,a7,0x3c
    1446:	03c85813          	srli	a6,a6,0x3c
    144a:	9171                	srli	a0,a0,0x3c
    144c:	91f1                	srli	a1,a1,0x3c
    144e:	92f1                	srli	a3,a3,0x3c
    1450:	9371                	srli	a4,a4,0x3c
    1452:	96d2                	add	a3,a3,s4
    1454:	9752                	add	a4,a4,s4
    1456:	9452                	add	s0,s0,s4
    1458:	92d2                	add	t0,t0,s4
    145a:	9fd2                	add	t6,t6,s4
    145c:	9f52                	add	t5,t5,s4
    145e:	9ed2                	add	t4,t4,s4
    1460:	9e52                	add	t3,t3,s4
    1462:	9352                	add	t1,t1,s4
    1464:	98d2                	add	a7,a7,s4
    1466:	93d2                	add	t2,t2,s4
    1468:	9852                	add	a6,a6,s4
    146a:	9552                	add	a0,a0,s4
    146c:	95d2                	add	a1,a1,s4
    146e:	0006c983          	lbu	s3,0(a3)
    1472:	0002c283          	lbu	t0,0(t0)
    1476:	00074683          	lbu	a3,0(a4)
    147a:	000fcf83          	lbu	t6,0(t6)
    147e:	000f4f03          	lbu	t5,0(t5)
    1482:	000ece83          	lbu	t4,0(t4)
    1486:	000e4e03          	lbu	t3,0(t3)
    148a:	00034303          	lbu	t1,0(t1)
    148e:	0008c883          	lbu	a7,0(a7)
    1492:	0003c383          	lbu	t2,0(t2)
    1496:	00084803          	lbu	a6,0(a6)
    149a:	00054503          	lbu	a0,0(a0)
    149e:	0005c583          	lbu	a1,0(a1)
    14a2:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14a6:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14aa:	9371                	srli	a4,a4,0x3c
    14ac:	8bbd                	andi	a5,a5,15
    14ae:	9752                	add	a4,a4,s4
    14b0:	97d2                	add	a5,a5,s4
    14b2:	005105a3          	sb	t0,11(sp)
    14b6:	01f10623          	sb	t6,12(sp)
    14ba:	01e106a3          	sb	t5,13(sp)
    14be:	01d10723          	sb	t4,14(sp)
    14c2:	01c107a3          	sb	t3,15(sp)
    14c6:	00610823          	sb	t1,16(sp)
    14ca:	011108a3          	sb	a7,17(sp)
    14ce:	00710923          	sb	t2,18(sp)
    14d2:	010109a3          	sb	a6,19(sp)
    14d6:	00a10a23          	sb	a0,20(sp)
    14da:	00b10aa3          	sb	a1,21(sp)
    14de:	01310b23          	sb	s3,22(sp)
    14e2:	00d10ba3          	sb	a3,23(sp)
    14e6:	00810523          	sb	s0,10(sp)
    14ea:	00074703          	lbu	a4,0(a4)
    14ee:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14f2:	002c                	addi	a1,sp,8
    14f4:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14f6:	00e10c23          	sb	a4,24(sp)
    14fa:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14fe:	00010d23          	sb	zero,26(sp)
        s += 2;
    1502:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1506:	085000ef          	jal	ra,1d8a <write>
        s += 2;
    150a:	b5bd                	j	1378 <printf+0xa2>
    char byte = c;
    150c:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1510:	4605                	li	a2,1
    1512:	002c                	addi	a1,sp,8
    1514:	4505                	li	a0,1
    char byte = c;
    1516:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    151a:	071000ef          	jal	ra,1d8a <write>
    char byte = c;
    151e:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1522:	4605                	li	a2,1
    1524:	002c                	addi	a1,sp,8
    1526:	4505                	li	a0,1
    char byte = c;
    1528:	00f10423          	sb	a5,8(sp)
        s += 2;
    152c:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1530:	05b000ef          	jal	ra,1d8a <write>
        s += 2;
    1534:	b591                	j	1378 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1536:	6782                	ld	a5,0(sp)
    1538:	6380                	ld	s0,0(a5)
    153a:	07a1                	addi	a5,a5,8
    153c:	e03e                	sd	a5,0(sp)
    153e:	cc05                	beqz	s0,1576 <printf+0x2a0>
            l = strnlen(a, 200);
    1540:	0c800593          	li	a1,200
    1544:	8522                	mv	a0,s0
    1546:	45a000ef          	jal	ra,19a0 <strnlen>
    write(f, s, l);
    154a:	0005061b          	sext.w	a2,a0
    154e:	85a2                	mv	a1,s0
    1550:	4505                	li	a0,1
    1552:	039000ef          	jal	ra,1d8a <write>
        s += 2;
    1556:	00248993          	addi	s3,s1,2
    155a:	bd39                	j	1378 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    155c:	0019c783          	lbu	a5,1(s3)
    1560:	84ce                	mv	s1,s3
    1562:	864e                	mv	a2,s3
    1564:	e52782e3          	beq	a5,s2,13a8 <printf+0xd2>
    write(f, s, l);
    1568:	4601                	li	a2,0
    156a:	85ce                	mv	a1,s3
    156c:	4505                	li	a0,1
    156e:	01d000ef          	jal	ra,1d8a <write>
    1572:	84ce                	mv	s1,s3
    1574:	bbd1                	j	1348 <printf+0x72>
                a = "(null)";
    1576:	845e                	mv	s0,s7
    1578:	b7e1                	j	1540 <printf+0x26a>

000000000000157a <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    157a:	1141                	addi	sp,sp,-16
    157c:	e406                	sd	ra,8(sp)
    puts(m);
    157e:	d37ff0ef          	jal	ra,12b4 <puts>
    exit(-100);
}
    1582:	60a2                	ld	ra,8(sp)
    exit(-100);
    1584:	f9c00513          	li	a0,-100
}
    1588:	0141                	addi	sp,sp,16
    exit(-100);
    158a:	0530006f          	j	1ddc <exit>

000000000000158e <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    158e:	02000793          	li	a5,32
    1592:	00f50663          	beq	a0,a5,159e <isspace+0x10>
    1596:	355d                	addiw	a0,a0,-9
    1598:	00553513          	sltiu	a0,a0,5
    159c:	8082                	ret
    159e:	4505                	li	a0,1
}
    15a0:	8082                	ret

00000000000015a2 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15a2:	fd05051b          	addiw	a0,a0,-48
}
    15a6:	00a53513          	sltiu	a0,a0,10
    15aa:	8082                	ret

00000000000015ac <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ac:	02000613          	li	a2,32
    15b0:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15b2:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b6:	0007079b          	sext.w	a5,a4
    15ba:	ff77869b          	addiw	a3,a5,-9
    15be:	04c70b63          	beq	a4,a2,1614 <atoi+0x68>
    15c2:	04d5f963          	bleu	a3,a1,1614 <atoi+0x68>
        s++;
    switch (*s)
    15c6:	02b00693          	li	a3,43
    15ca:	04d70a63          	beq	a4,a3,161e <atoi+0x72>
    15ce:	02d00693          	li	a3,45
    15d2:	06d70463          	beq	a4,a3,163a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15d6:	fd07859b          	addiw	a1,a5,-48
    15da:	4625                	li	a2,9
    15dc:	873e                	mv	a4,a5
    15de:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15e0:	4e01                	li	t3,0
    while (isdigit(*s))
    15e2:	04b66a63          	bltu	a2,a1,1636 <atoi+0x8a>
    int n = 0, neg = 0;
    15e6:	4501                	li	a0,0
    while (isdigit(*s))
    15e8:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15ea:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15ec:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15f0:	0025179b          	slliw	a5,a0,0x2
    15f4:	9d3d                	addw	a0,a0,a5
    15f6:	fd07031b          	addiw	t1,a4,-48
    15fa:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15fe:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    1602:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1606:	0006071b          	sext.w	a4,a2
    160a:	feb870e3          	bleu	a1,a6,15ea <atoi+0x3e>
    return neg ? n : -n;
    160e:	000e0563          	beqz	t3,1618 <atoi+0x6c>
}
    1612:	8082                	ret
        s++;
    1614:	0505                	addi	a0,a0,1
    1616:	bf71                	j	15b2 <atoi+0x6>
    1618:	4113053b          	subw	a0,t1,a7
    161c:	8082                	ret
    while (isdigit(*s))
    161e:	00154783          	lbu	a5,1(a0)
    1622:	4625                	li	a2,9
        s++;
    1624:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1628:	fd07859b          	addiw	a1,a5,-48
    162c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1630:	4e01                	li	t3,0
    while (isdigit(*s))
    1632:	fab67ae3          	bleu	a1,a2,15e6 <atoi+0x3a>
    1636:	4501                	li	a0,0
}
    1638:	8082                	ret
    while (isdigit(*s))
    163a:	00154783          	lbu	a5,1(a0)
    163e:	4625                	li	a2,9
        s++;
    1640:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1644:	fd07859b          	addiw	a1,a5,-48
    1648:	0007871b          	sext.w	a4,a5
    164c:	feb665e3          	bltu	a2,a1,1636 <atoi+0x8a>
        neg = 1;
    1650:	4e05                	li	t3,1
    1652:	bf51                	j	15e6 <atoi+0x3a>

0000000000001654 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1654:	16060d63          	beqz	a2,17ce <memset+0x17a>
    1658:	40a007b3          	neg	a5,a0
    165c:	8b9d                	andi	a5,a5,7
    165e:	00778713          	addi	a4,a5,7
    1662:	482d                	li	a6,11
    1664:	0ff5f593          	andi	a1,a1,255
    1668:	fff60693          	addi	a3,a2,-1
    166c:	17076263          	bltu	a4,a6,17d0 <memset+0x17c>
    1670:	16e6ea63          	bltu	a3,a4,17e4 <memset+0x190>
    1674:	16078563          	beqz	a5,17de <memset+0x18a>
    1678:	00b50023          	sb	a1,0(a0)
    167c:	4705                	li	a4,1
    167e:	00150e93          	addi	t4,a0,1
    1682:	14e78c63          	beq	a5,a4,17da <memset+0x186>
    1686:	00b500a3          	sb	a1,1(a0)
    168a:	4709                	li	a4,2
    168c:	00250e93          	addi	t4,a0,2
    1690:	14e78d63          	beq	a5,a4,17ea <memset+0x196>
    1694:	00b50123          	sb	a1,2(a0)
    1698:	470d                	li	a4,3
    169a:	00350e93          	addi	t4,a0,3
    169e:	12e78b63          	beq	a5,a4,17d4 <memset+0x180>
    16a2:	00b501a3          	sb	a1,3(a0)
    16a6:	4711                	li	a4,4
    16a8:	00450e93          	addi	t4,a0,4
    16ac:	14e78163          	beq	a5,a4,17ee <memset+0x19a>
    16b0:	00b50223          	sb	a1,4(a0)
    16b4:	4715                	li	a4,5
    16b6:	00550e93          	addi	t4,a0,5
    16ba:	12e78c63          	beq	a5,a4,17f2 <memset+0x19e>
    16be:	00b502a3          	sb	a1,5(a0)
    16c2:	471d                	li	a4,7
    16c4:	00650e93          	addi	t4,a0,6
    16c8:	12e79763          	bne	a5,a4,17f6 <memset+0x1a2>
    16cc:	00750e93          	addi	t4,a0,7
    16d0:	00b50323          	sb	a1,6(a0)
    16d4:	4f1d                	li	t5,7
    16d6:	00859713          	slli	a4,a1,0x8
    16da:	8f4d                	or	a4,a4,a1
    16dc:	01059e13          	slli	t3,a1,0x10
    16e0:	01c76e33          	or	t3,a4,t3
    16e4:	01859313          	slli	t1,a1,0x18
    16e8:	006e6333          	or	t1,t3,t1
    16ec:	02059893          	slli	a7,a1,0x20
    16f0:	011368b3          	or	a7,t1,a7
    16f4:	02859813          	slli	a6,a1,0x28
    16f8:	40f60333          	sub	t1,a2,a5
    16fc:	0108e833          	or	a6,a7,a6
    1700:	03059693          	slli	a3,a1,0x30
    1704:	00d866b3          	or	a3,a6,a3
    1708:	03859713          	slli	a4,a1,0x38
    170c:	97aa                	add	a5,a5,a0
    170e:	ff837813          	andi	a6,t1,-8
    1712:	8f55                	or	a4,a4,a3
    1714:	00f806b3          	add	a3,a6,a5
    1718:	e398                	sd	a4,0(a5)
    171a:	07a1                	addi	a5,a5,8
    171c:	fed79ee3          	bne	a5,a3,1718 <memset+0xc4>
    1720:	ff837693          	andi	a3,t1,-8
    1724:	00de87b3          	add	a5,t4,a3
    1728:	01e6873b          	addw	a4,a3,t5
    172c:	0ad30663          	beq	t1,a3,17d8 <memset+0x184>
    1730:	00b78023          	sb	a1,0(a5)
    1734:	0017069b          	addiw	a3,a4,1
    1738:	08c6fb63          	bleu	a2,a3,17ce <memset+0x17a>
    173c:	00b780a3          	sb	a1,1(a5)
    1740:	0027069b          	addiw	a3,a4,2
    1744:	08c6f563          	bleu	a2,a3,17ce <memset+0x17a>
    1748:	00b78123          	sb	a1,2(a5)
    174c:	0037069b          	addiw	a3,a4,3
    1750:	06c6ff63          	bleu	a2,a3,17ce <memset+0x17a>
    1754:	00b781a3          	sb	a1,3(a5)
    1758:	0047069b          	addiw	a3,a4,4
    175c:	06c6f963          	bleu	a2,a3,17ce <memset+0x17a>
    1760:	00b78223          	sb	a1,4(a5)
    1764:	0057069b          	addiw	a3,a4,5
    1768:	06c6f363          	bleu	a2,a3,17ce <memset+0x17a>
    176c:	00b782a3          	sb	a1,5(a5)
    1770:	0067069b          	addiw	a3,a4,6
    1774:	04c6fd63          	bleu	a2,a3,17ce <memset+0x17a>
    1778:	00b78323          	sb	a1,6(a5)
    177c:	0077069b          	addiw	a3,a4,7
    1780:	04c6f763          	bleu	a2,a3,17ce <memset+0x17a>
    1784:	00b783a3          	sb	a1,7(a5)
    1788:	0087069b          	addiw	a3,a4,8
    178c:	04c6f163          	bleu	a2,a3,17ce <memset+0x17a>
    1790:	00b78423          	sb	a1,8(a5)
    1794:	0097069b          	addiw	a3,a4,9
    1798:	02c6fb63          	bleu	a2,a3,17ce <memset+0x17a>
    179c:	00b784a3          	sb	a1,9(a5)
    17a0:	00a7069b          	addiw	a3,a4,10
    17a4:	02c6f563          	bleu	a2,a3,17ce <memset+0x17a>
    17a8:	00b78523          	sb	a1,10(a5)
    17ac:	00b7069b          	addiw	a3,a4,11
    17b0:	00c6ff63          	bleu	a2,a3,17ce <memset+0x17a>
    17b4:	00b785a3          	sb	a1,11(a5)
    17b8:	00c7069b          	addiw	a3,a4,12
    17bc:	00c6f963          	bleu	a2,a3,17ce <memset+0x17a>
    17c0:	00b78623          	sb	a1,12(a5)
    17c4:	2735                	addiw	a4,a4,13
    17c6:	00c77463          	bleu	a2,a4,17ce <memset+0x17a>
    17ca:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17ce:	8082                	ret
    17d0:	472d                	li	a4,11
    17d2:	bd79                	j	1670 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17d4:	4f0d                	li	t5,3
    17d6:	b701                	j	16d6 <memset+0x82>
    17d8:	8082                	ret
    17da:	4f05                	li	t5,1
    17dc:	bded                	j	16d6 <memset+0x82>
    17de:	8eaa                	mv	t4,a0
    17e0:	4f01                	li	t5,0
    17e2:	bdd5                	j	16d6 <memset+0x82>
    17e4:	87aa                	mv	a5,a0
    17e6:	4701                	li	a4,0
    17e8:	b7a1                	j	1730 <memset+0xdc>
    17ea:	4f09                	li	t5,2
    17ec:	b5ed                	j	16d6 <memset+0x82>
    17ee:	4f11                	li	t5,4
    17f0:	b5dd                	j	16d6 <memset+0x82>
    17f2:	4f15                	li	t5,5
    17f4:	b5cd                	j	16d6 <memset+0x82>
    17f6:	4f19                	li	t5,6
    17f8:	bdf9                	j	16d6 <memset+0x82>

00000000000017fa <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17fa:	00054703          	lbu	a4,0(a0)
    17fe:	0005c783          	lbu	a5,0(a1)
    1802:	00e79b63          	bne	a5,a4,1818 <strcmp+0x1e>
    1806:	cf89                	beqz	a5,1820 <strcmp+0x26>
    1808:	0505                	addi	a0,a0,1
    180a:	0585                	addi	a1,a1,1
    180c:	0005c783          	lbu	a5,0(a1)
    1810:	00054703          	lbu	a4,0(a0)
    1814:	fef709e3          	beq	a4,a5,1806 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1818:	0007051b          	sext.w	a0,a4
}
    181c:	9d1d                	subw	a0,a0,a5
    181e:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1820:	4501                	li	a0,0
}
    1822:	9d1d                	subw	a0,a0,a5
    1824:	8082                	ret

0000000000001826 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1826:	c231                	beqz	a2,186a <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1828:	00054783          	lbu	a5,0(a0)
    182c:	0005c683          	lbu	a3,0(a1)
    1830:	c795                	beqz	a5,185c <strncmp+0x36>
    1832:	ca85                	beqz	a3,1862 <strncmp+0x3c>
    if (!n--)
    1834:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1836:	c615                	beqz	a2,1862 <strncmp+0x3c>
    1838:	00150713          	addi	a4,a0,1
    183c:	9532                	add	a0,a0,a2
    183e:	00d78963          	beq	a5,a3,1850 <strncmp+0x2a>
    1842:	a005                	j	1862 <strncmp+0x3c>
    1844:	ce99                	beqz	a3,1862 <strncmp+0x3c>
    1846:	00e50e63          	beq	a0,a4,1862 <strncmp+0x3c>
    184a:	0705                	addi	a4,a4,1
    184c:	00d79b63          	bne	a5,a3,1862 <strncmp+0x3c>
    1850:	00074783          	lbu	a5,0(a4)
    1854:	0585                	addi	a1,a1,1
    1856:	0005c683          	lbu	a3,0(a1)
    185a:	f7ed                	bnez	a5,1844 <strncmp+0x1e>
    185c:	4501                	li	a0,0
        ;
    return *l - *r;
    185e:	9d15                	subw	a0,a0,a3
    1860:	8082                	ret
    1862:	0007851b          	sext.w	a0,a5
    1866:	9d15                	subw	a0,a0,a3
    1868:	8082                	ret
        return 0;
    186a:	4501                	li	a0,0
}
    186c:	8082                	ret

000000000000186e <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    186e:	00757793          	andi	a5,a0,7
    1872:	cfa1                	beqz	a5,18ca <strlen+0x5c>
        if (!*s)
    1874:	00054783          	lbu	a5,0(a0)
    1878:	cbb9                	beqz	a5,18ce <strlen+0x60>
    187a:	87aa                	mv	a5,a0
    187c:	a021                	j	1884 <strlen+0x16>
    187e:	0007c703          	lbu	a4,0(a5)
    1882:	c329                	beqz	a4,18c4 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1884:	0785                	addi	a5,a5,1
    1886:	0077f713          	andi	a4,a5,7
    188a:	fb75                	bnez	a4,187e <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    188c:	00000717          	auipc	a4,0x0
    1890:	7d470713          	addi	a4,a4,2004 # 2060 <__clone+0x9c>
    1894:	630c                	ld	a1,0(a4)
    1896:	00000717          	auipc	a4,0x0
    189a:	7d270713          	addi	a4,a4,2002 # 2068 <__clone+0xa4>
    189e:	6394                	ld	a3,0(a5)
    18a0:	6310                	ld	a2,0(a4)
    18a2:	a019                	j	18a8 <strlen+0x3a>
    18a4:	07a1                	addi	a5,a5,8
    18a6:	6394                	ld	a3,0(a5)
    18a8:	00b68733          	add	a4,a3,a1
    18ac:	fff6c693          	not	a3,a3
    18b0:	8f75                	and	a4,a4,a3
    18b2:	8f71                	and	a4,a4,a2
    18b4:	db65                	beqz	a4,18a4 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18b6:	0007c703          	lbu	a4,0(a5)
    18ba:	c709                	beqz	a4,18c4 <strlen+0x56>
    18bc:	0785                	addi	a5,a5,1
    18be:	0007c703          	lbu	a4,0(a5)
    18c2:	ff6d                	bnez	a4,18bc <strlen+0x4e>
        ;
    return s - a;
    18c4:	40a78533          	sub	a0,a5,a0
}
    18c8:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18ca:	87aa                	mv	a5,a0
    18cc:	b7c1                	j	188c <strlen+0x1e>
        if (!*s)
    18ce:	4501                	li	a0,0
            return s - a;
    18d0:	8082                	ret

00000000000018d2 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18d2:	00757793          	andi	a5,a0,7
    18d6:	0ff5f593          	andi	a1,a1,255
    18da:	cb99                	beqz	a5,18f0 <memchr+0x1e>
    18dc:	c655                	beqz	a2,1988 <memchr+0xb6>
    18de:	00054783          	lbu	a5,0(a0)
    18e2:	0ab78663          	beq	a5,a1,198e <memchr+0xbc>
    18e6:	0505                	addi	a0,a0,1
    18e8:	00757793          	andi	a5,a0,7
    18ec:	167d                	addi	a2,a2,-1
    18ee:	f7fd                	bnez	a5,18dc <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18f0:	4701                	li	a4,0
    if (n && *s != c)
    18f2:	ca49                	beqz	a2,1984 <memchr+0xb2>
    18f4:	00054783          	lbu	a5,0(a0)
    18f8:	08b78b63          	beq	a5,a1,198e <memchr+0xbc>
        size_t k = ONES * c;
    18fc:	00000797          	auipc	a5,0x0
    1900:	77478793          	addi	a5,a5,1908 # 2070 <__clone+0xac>
    1904:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1906:	479d                	li	a5,7
        size_t k = ONES * c;
    1908:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    190c:	08c7f863          	bleu	a2,a5,199c <memchr+0xca>
    1910:	611c                	ld	a5,0(a0)
    1912:	00000317          	auipc	t1,0x0
    1916:	75630313          	addi	t1,t1,1878 # 2068 <__clone+0xa4>
    191a:	00033803          	ld	a6,0(t1)
    191e:	00f8c7b3          	xor	a5,a7,a5
    1922:	fff7c713          	not	a4,a5
    1926:	8f95                	sub	a5,a5,a3
    1928:	8ff9                	and	a5,a5,a4
    192a:	0107f7b3          	and	a5,a5,a6
    192e:	e7bd                	bnez	a5,199c <memchr+0xca>
    1930:	4e1d                	li	t3,7
    1932:	00000e97          	auipc	t4,0x0
    1936:	72ee8e93          	addi	t4,t4,1838 # 2060 <__clone+0x9c>
    193a:	a005                	j	195a <memchr+0x88>
    193c:	6514                	ld	a3,8(a0)
    193e:	000eb783          	ld	a5,0(t4)
    1942:	00033803          	ld	a6,0(t1)
    1946:	00d8c6b3          	xor	a3,a7,a3
    194a:	97b6                	add	a5,a5,a3
    194c:	fff6c693          	not	a3,a3
    1950:	8ff5                	and	a5,a5,a3
    1952:	0107f7b3          	and	a5,a5,a6
    1956:	e3a1                	bnez	a5,1996 <memchr+0xc4>
    1958:	853a                	mv	a0,a4
    195a:	1661                	addi	a2,a2,-8
    195c:	00850713          	addi	a4,a0,8
    1960:	fcce6ee3          	bltu	t3,a2,193c <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1964:	c215                	beqz	a2,1988 <memchr+0xb6>
    1966:	00074783          	lbu	a5,0(a4)
    196a:	00f58d63          	beq	a1,a5,1984 <memchr+0xb2>
    196e:	00170793          	addi	a5,a4,1
    1972:	963a                	add	a2,a2,a4
    1974:	873e                	mv	a4,a5
    1976:	00f60963          	beq	a2,a5,1988 <memchr+0xb6>
    197a:	0007c683          	lbu	a3,0(a5)
    197e:	0785                	addi	a5,a5,1
    1980:	feb69ae3          	bne	a3,a1,1974 <memchr+0xa2>
}
    1984:	853a                	mv	a0,a4
    1986:	8082                	ret
    return n ? (void *)s : 0;
    1988:	4701                	li	a4,0
}
    198a:	853a                	mv	a0,a4
    198c:	8082                	ret
    198e:	872a                	mv	a4,a0
    1990:	00074783          	lbu	a5,0(a4)
    1994:	bfd9                	j	196a <memchr+0x98>
    1996:	00854783          	lbu	a5,8(a0)
    199a:	bfc1                	j	196a <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    199c:	872a                	mv	a4,a0
    199e:	bfc1                	j	196e <memchr+0x9c>

00000000000019a0 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19a0:	00757793          	andi	a5,a0,7
    19a4:	cfc5                	beqz	a5,1a5c <strnlen+0xbc>
    19a6:	c1c5                	beqz	a1,1a46 <strnlen+0xa6>
    19a8:	00054783          	lbu	a5,0(a0)
    19ac:	cfd9                	beqz	a5,1a4a <strnlen+0xaa>
    19ae:	87ae                	mv	a5,a1
    19b0:	86aa                	mv	a3,a0
    19b2:	a029                	j	19bc <strnlen+0x1c>
    19b4:	cbc9                	beqz	a5,1a46 <strnlen+0xa6>
    19b6:	0006c703          	lbu	a4,0(a3)
    19ba:	cb51                	beqz	a4,1a4e <strnlen+0xae>
    19bc:	0685                	addi	a3,a3,1
    19be:	0076f713          	andi	a4,a3,7
    19c2:	17fd                	addi	a5,a5,-1
    19c4:	fb65                	bnez	a4,19b4 <strnlen+0x14>
    if (n && *s != c)
    19c6:	c3c1                	beqz	a5,1a46 <strnlen+0xa6>
    19c8:	0006c703          	lbu	a4,0(a3)
    19cc:	c349                	beqz	a4,1a4e <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19ce:	471d                	li	a4,7
    19d0:	08f77a63          	bleu	a5,a4,1a64 <strnlen+0xc4>
    19d4:	00000e17          	auipc	t3,0x0
    19d8:	68ce0e13          	addi	t3,t3,1676 # 2060 <__clone+0x9c>
    19dc:	6290                	ld	a2,0(a3)
    19de:	000e3703          	ld	a4,0(t3)
    19e2:	00000e97          	auipc	t4,0x0
    19e6:	686e8e93          	addi	t4,t4,1670 # 2068 <__clone+0xa4>
    19ea:	000eb803          	ld	a6,0(t4)
    19ee:	9732                	add	a4,a4,a2
    19f0:	fff64613          	not	a2,a2
    19f4:	8f71                	and	a4,a4,a2
    19f6:	01077733          	and	a4,a4,a6
    19fa:	e72d                	bnez	a4,1a64 <strnlen+0xc4>
    19fc:	4f1d                	li	t5,7
    19fe:	a839                	j	1a1c <strnlen+0x7c>
    1a00:	6698                	ld	a4,8(a3)
    1a02:	000e3303          	ld	t1,0(t3)
    1a06:	000eb803          	ld	a6,0(t4)
    1a0a:	fff74893          	not	a7,a4
    1a0e:	971a                	add	a4,a4,t1
    1a10:	01177733          	and	a4,a4,a7
    1a14:	01077733          	and	a4,a4,a6
    1a18:	ef1d                	bnez	a4,1a56 <strnlen+0xb6>
    1a1a:	86b2                	mv	a3,a2
    1a1c:	17e1                	addi	a5,a5,-8
    1a1e:	00868613          	addi	a2,a3,8
    1a22:	fcff6fe3          	bltu	t5,a5,1a00 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a26:	c385                	beqz	a5,1a46 <strnlen+0xa6>
    1a28:	00064703          	lbu	a4,0(a2)
    1a2c:	cb19                	beqz	a4,1a42 <strnlen+0xa2>
    1a2e:	00160713          	addi	a4,a2,1
    1a32:	97b2                	add	a5,a5,a2
    1a34:	863a                	mv	a2,a4
    1a36:	00e78863          	beq	a5,a4,1a46 <strnlen+0xa6>
    1a3a:	0705                	addi	a4,a4,1
    1a3c:	fff74683          	lbu	a3,-1(a4)
    1a40:	faf5                	bnez	a3,1a34 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a42:	40a605b3          	sub	a1,a2,a0
}
    1a46:	852e                	mv	a0,a1
    1a48:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a4a:	87ae                	mv	a5,a1
    1a4c:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a4e:	8636                	mv	a2,a3
    1a50:	00064703          	lbu	a4,0(a2)
    1a54:	bfe1                	j	1a2c <strnlen+0x8c>
    1a56:	0086c703          	lbu	a4,8(a3)
    1a5a:	bfc9                	j	1a2c <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a5c:	87ae                	mv	a5,a1
    1a5e:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a60:	f7a5                	bnez	a5,19c8 <strnlen+0x28>
    1a62:	b7d5                	j	1a46 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a64:	8636                	mv	a2,a3
    1a66:	b7e1                	j	1a2e <strnlen+0x8e>

0000000000001a68 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a68:	00b547b3          	xor	a5,a0,a1
    1a6c:	8b9d                	andi	a5,a5,7
    1a6e:	efa9                	bnez	a5,1ac8 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a70:	0075f793          	andi	a5,a1,7
    1a74:	c38d                	beqz	a5,1a96 <strcpy+0x2e>
            if (!(*d = *s))
    1a76:	0005c783          	lbu	a5,0(a1)
    1a7a:	00f50023          	sb	a5,0(a0)
    1a7e:	e799                	bnez	a5,1a8c <strcpy+0x24>
    1a80:	a095                	j	1ae4 <strcpy+0x7c>
    1a82:	0005c783          	lbu	a5,0(a1)
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	cbb9                	beqz	a5,1ae0 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a8c:	0585                	addi	a1,a1,1
    1a8e:	0075f793          	andi	a5,a1,7
    1a92:	0505                	addi	a0,a0,1
    1a94:	f7fd                	bnez	a5,1a82 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a96:	00000797          	auipc	a5,0x0
    1a9a:	5ca78793          	addi	a5,a5,1482 # 2060 <__clone+0x9c>
    1a9e:	0007b803          	ld	a6,0(a5)
    1aa2:	00000797          	auipc	a5,0x0
    1aa6:	5c678793          	addi	a5,a5,1478 # 2068 <__clone+0xa4>
    1aaa:	6198                	ld	a4,0(a1)
    1aac:	6390                	ld	a2,0(a5)
    1aae:	a031                	j	1aba <strcpy+0x52>
    1ab0:	0521                	addi	a0,a0,8
    1ab2:	05a1                	addi	a1,a1,8
    1ab4:	fee53c23          	sd	a4,-8(a0)
    1ab8:	6198                	ld	a4,0(a1)
    1aba:	010707b3          	add	a5,a4,a6
    1abe:	fff74693          	not	a3,a4
    1ac2:	8ff5                	and	a5,a5,a3
    1ac4:	8ff1                	and	a5,a5,a2
    1ac6:	d7ed                	beqz	a5,1ab0 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ac8:	0005c783          	lbu	a5,0(a1)
    1acc:	00f50023          	sb	a5,0(a0)
    1ad0:	cb89                	beqz	a5,1ae2 <strcpy+0x7a>
    1ad2:	0585                	addi	a1,a1,1
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	0505                	addi	a0,a0,1
    1ada:	00f50023          	sb	a5,0(a0)
    1ade:	fbf5                	bnez	a5,1ad2 <strcpy+0x6a>
        ;
    return d;
}
    1ae0:	8082                	ret
    1ae2:	8082                	ret
    1ae4:	8082                	ret

0000000000001ae6 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1ae6:	00b547b3          	xor	a5,a0,a1
    1aea:	8b9d                	andi	a5,a5,7
    1aec:	ebc1                	bnez	a5,1b7c <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1aee:	0075f793          	andi	a5,a1,7
    1af2:	cf91                	beqz	a5,1b0e <strncpy+0x28>
    1af4:	20060e63          	beqz	a2,1d10 <strncpy+0x22a>
    1af8:	0005c783          	lbu	a5,0(a1)
    1afc:	00f50023          	sb	a5,0(a0)
    1b00:	c3d5                	beqz	a5,1ba4 <strncpy+0xbe>
    1b02:	0585                	addi	a1,a1,1
    1b04:	0075f793          	andi	a5,a1,7
    1b08:	167d                	addi	a2,a2,-1
    1b0a:	0505                	addi	a0,a0,1
    1b0c:	f7e5                	bnez	a5,1af4 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b0e:	20060163          	beqz	a2,1d10 <strncpy+0x22a>
    1b12:	0005c683          	lbu	a3,0(a1)
    1b16:	c6d9                	beqz	a3,1ba4 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b18:	479d                	li	a5,7
    1b1a:	22c7f563          	bleu	a2,a5,1d44 <strncpy+0x25e>
    1b1e:	00000317          	auipc	t1,0x0
    1b22:	54230313          	addi	t1,t1,1346 # 2060 <__clone+0x9c>
    1b26:	6198                	ld	a4,0(a1)
    1b28:	00033783          	ld	a5,0(t1)
    1b2c:	00000e17          	auipc	t3,0x0
    1b30:	53ce0e13          	addi	t3,t3,1340 # 2068 <__clone+0xa4>
    1b34:	000e3803          	ld	a6,0(t3)
    1b38:	97ba                	add	a5,a5,a4
    1b3a:	fff74893          	not	a7,a4
    1b3e:	0117f7b3          	and	a5,a5,a7
    1b42:	0107f7b3          	and	a5,a5,a6
    1b46:	1e079f63          	bnez	a5,1d44 <strncpy+0x25e>
    1b4a:	4e9d                	li	t4,7
    1b4c:	a005                	j	1b6c <strncpy+0x86>
    1b4e:	6598                	ld	a4,8(a1)
    1b50:	00033783          	ld	a5,0(t1)
    1b54:	000e3803          	ld	a6,0(t3)
    1b58:	fff74893          	not	a7,a4
    1b5c:	97ba                	add	a5,a5,a4
    1b5e:	0117f7b3          	and	a5,a5,a7
    1b62:	0107f7b3          	and	a5,a5,a6
    1b66:	1a079f63          	bnez	a5,1d24 <strncpy+0x23e>
    1b6a:	85b6                	mv	a1,a3
            *wd = *ws;
    1b6c:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b6e:	1661                	addi	a2,a2,-8
    1b70:	00858693          	addi	a3,a1,8
    1b74:	0521                	addi	a0,a0,8
    1b76:	fcceece3          	bltu	t4,a2,1b4e <strncpy+0x68>
    1b7a:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b7c:	18060a63          	beqz	a2,1d10 <strncpy+0x22a>
    1b80:	0005c783          	lbu	a5,0(a1)
    1b84:	872a                	mv	a4,a0
    1b86:	00f50023          	sb	a5,0(a0)
    1b8a:	e799                	bnez	a5,1b98 <strncpy+0xb2>
    1b8c:	a829                	j	1ba6 <strncpy+0xc0>
    1b8e:	0005c783          	lbu	a5,0(a1)
    1b92:	00f70023          	sb	a5,0(a4)
    1b96:	cb81                	beqz	a5,1ba6 <strncpy+0xc0>
    1b98:	167d                	addi	a2,a2,-1
    1b9a:	0585                	addi	a1,a1,1
    1b9c:	0705                	addi	a4,a4,1
    1b9e:	fa65                	bnez	a2,1b8e <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1ba0:	853a                	mv	a0,a4
    1ba2:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1ba4:	872a                	mv	a4,a0
    1ba6:	4805                	li	a6,1
    1ba8:	14061c63          	bnez	a2,1d00 <strncpy+0x21a>
    1bac:	40e007b3          	neg	a5,a4
    1bb0:	8b9d                	andi	a5,a5,7
    1bb2:	4581                	li	a1,0
    1bb4:	12061e63          	bnez	a2,1cf0 <strncpy+0x20a>
    1bb8:	00778693          	addi	a3,a5,7
    1bbc:	452d                	li	a0,11
    1bbe:	12a6e763          	bltu	a3,a0,1cec <strncpy+0x206>
    1bc2:	16d5e663          	bltu	a1,a3,1d2e <strncpy+0x248>
    1bc6:	14078c63          	beqz	a5,1d1e <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bca:	00070023          	sb	zero,0(a4)
    1bce:	4585                	li	a1,1
    1bd0:	00170693          	addi	a3,a4,1
    1bd4:	14b78363          	beq	a5,a1,1d1a <strncpy+0x234>
    1bd8:	000700a3          	sb	zero,1(a4)
    1bdc:	4589                	li	a1,2
    1bde:	00270693          	addi	a3,a4,2
    1be2:	14b78963          	beq	a5,a1,1d34 <strncpy+0x24e>
    1be6:	00070123          	sb	zero,2(a4)
    1bea:	458d                	li	a1,3
    1bec:	00370693          	addi	a3,a4,3
    1bf0:	12b78363          	beq	a5,a1,1d16 <strncpy+0x230>
    1bf4:	000701a3          	sb	zero,3(a4)
    1bf8:	4591                	li	a1,4
    1bfa:	00470693          	addi	a3,a4,4
    1bfe:	12b78d63          	beq	a5,a1,1d38 <strncpy+0x252>
    1c02:	00070223          	sb	zero,4(a4)
    1c06:	4595                	li	a1,5
    1c08:	00570693          	addi	a3,a4,5
    1c0c:	12b78863          	beq	a5,a1,1d3c <strncpy+0x256>
    1c10:	000702a3          	sb	zero,5(a4)
    1c14:	459d                	li	a1,7
    1c16:	00670693          	addi	a3,a4,6
    1c1a:	12b79363          	bne	a5,a1,1d40 <strncpy+0x25a>
    1c1e:	00770693          	addi	a3,a4,7
    1c22:	00070323          	sb	zero,6(a4)
    1c26:	40f80833          	sub	a6,a6,a5
    1c2a:	ff887513          	andi	a0,a6,-8
    1c2e:	97ba                	add	a5,a5,a4
    1c30:	953e                	add	a0,a0,a5
    1c32:	0007b023          	sd	zero,0(a5)
    1c36:	07a1                	addi	a5,a5,8
    1c38:	fea79de3          	bne	a5,a0,1c32 <strncpy+0x14c>
    1c3c:	ff887513          	andi	a0,a6,-8
    1c40:	9da9                	addw	a1,a1,a0
    1c42:	00a687b3          	add	a5,a3,a0
    1c46:	f4a80de3          	beq	a6,a0,1ba0 <strncpy+0xba>
    1c4a:	00078023          	sb	zero,0(a5)
    1c4e:	0015869b          	addiw	a3,a1,1
    1c52:	f4c6f7e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c56:	000780a3          	sb	zero,1(a5)
    1c5a:	0025869b          	addiw	a3,a1,2
    1c5e:	f4c6f1e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c62:	00078123          	sb	zero,2(a5)
    1c66:	0035869b          	addiw	a3,a1,3
    1c6a:	f2c6fbe3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c6e:	000781a3          	sb	zero,3(a5)
    1c72:	0045869b          	addiw	a3,a1,4
    1c76:	f2c6f5e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c7a:	00078223          	sb	zero,4(a5)
    1c7e:	0055869b          	addiw	a3,a1,5
    1c82:	f0c6ffe3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c86:	000782a3          	sb	zero,5(a5)
    1c8a:	0065869b          	addiw	a3,a1,6
    1c8e:	f0c6f9e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c92:	00078323          	sb	zero,6(a5)
    1c96:	0075869b          	addiw	a3,a1,7
    1c9a:	f0c6f3e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1c9e:	000783a3          	sb	zero,7(a5)
    1ca2:	0085869b          	addiw	a3,a1,8
    1ca6:	eec6fde3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1caa:	00078423          	sb	zero,8(a5)
    1cae:	0095869b          	addiw	a3,a1,9
    1cb2:	eec6f7e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1cb6:	000784a3          	sb	zero,9(a5)
    1cba:	00a5869b          	addiw	a3,a1,10
    1cbe:	eec6f1e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1cc2:	00078523          	sb	zero,10(a5)
    1cc6:	00b5869b          	addiw	a3,a1,11
    1cca:	ecc6fbe3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1cce:	000785a3          	sb	zero,11(a5)
    1cd2:	00c5869b          	addiw	a3,a1,12
    1cd6:	ecc6f5e3          	bleu	a2,a3,1ba0 <strncpy+0xba>
    1cda:	00078623          	sb	zero,12(a5)
    1cde:	25b5                	addiw	a1,a1,13
    1ce0:	ecc5f0e3          	bleu	a2,a1,1ba0 <strncpy+0xba>
    1ce4:	000786a3          	sb	zero,13(a5)
}
    1ce8:	853a                	mv	a0,a4
    1cea:	8082                	ret
    1cec:	46ad                	li	a3,11
    1cee:	bdd1                	j	1bc2 <strncpy+0xdc>
    1cf0:	00778693          	addi	a3,a5,7
    1cf4:	452d                	li	a0,11
    1cf6:	fff60593          	addi	a1,a2,-1
    1cfa:	eca6f4e3          	bleu	a0,a3,1bc2 <strncpy+0xdc>
    1cfe:	b7fd                	j	1cec <strncpy+0x206>
    1d00:	40e007b3          	neg	a5,a4
    1d04:	8832                	mv	a6,a2
    1d06:	8b9d                	andi	a5,a5,7
    1d08:	4581                	li	a1,0
    1d0a:	ea0607e3          	beqz	a2,1bb8 <strncpy+0xd2>
    1d0e:	b7cd                	j	1cf0 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d10:	872a                	mv	a4,a0
}
    1d12:	853a                	mv	a0,a4
    1d14:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d16:	458d                	li	a1,3
    1d18:	b739                	j	1c26 <strncpy+0x140>
    1d1a:	4585                	li	a1,1
    1d1c:	b729                	j	1c26 <strncpy+0x140>
    1d1e:	86ba                	mv	a3,a4
    1d20:	4581                	li	a1,0
    1d22:	b711                	j	1c26 <strncpy+0x140>
    1d24:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d28:	872a                	mv	a4,a0
    1d2a:	85b6                	mv	a1,a3
    1d2c:	bda9                	j	1b86 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d2e:	87ba                	mv	a5,a4
    1d30:	4581                	li	a1,0
    1d32:	bf21                	j	1c4a <strncpy+0x164>
    1d34:	4589                	li	a1,2
    1d36:	bdc5                	j	1c26 <strncpy+0x140>
    1d38:	4591                	li	a1,4
    1d3a:	b5f5                	j	1c26 <strncpy+0x140>
    1d3c:	4595                	li	a1,5
    1d3e:	b5e5                	j	1c26 <strncpy+0x140>
    1d40:	4599                	li	a1,6
    1d42:	b5d5                	j	1c26 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d44:	00d50023          	sb	a3,0(a0)
    1d48:	872a                	mv	a4,a0
    1d4a:	b5b9                	j	1b98 <strncpy+0xb2>

0000000000001d4c <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d4c:	87aa                	mv	a5,a0
    1d4e:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d50:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d54:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d58:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d5a:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d5c:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d60:	2501                	sext.w	a0,a0
    1d62:	8082                	ret

0000000000001d64 <openat>:
    register long a7 __asm__("a7") = n;
    1d64:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d68:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d6c:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <close>:
    register long a7 __asm__("a7") = n;
    1d74:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d78:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <read>:
    register long a7 __asm__("a7") = n;
    1d80:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d84:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d88:	8082                	ret

0000000000001d8a <write>:
    register long a7 __asm__("a7") = n;
    1d8a:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d8e:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d92:	8082                	ret

0000000000001d94 <getpid>:
    register long a7 __asm__("a7") = n;
    1d94:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d98:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d9c:	2501                	sext.w	a0,a0
    1d9e:	8082                	ret

0000000000001da0 <getppid>:
    register long a7 __asm__("a7") = n;
    1da0:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1da4:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <sched_yield>:
    register long a7 __asm__("a7") = n;
    1dac:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1db0:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <fork>:
    register long a7 __asm__("a7") = n;
    1db8:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dbc:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dbe:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc0:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dc8:	85b2                	mv	a1,a2
    1dca:	863a                	mv	a2,a4
    if (stack)
    1dcc:	c191                	beqz	a1,1dd0 <clone+0x8>
	stack += stack_size;
    1dce:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dd0:	4781                	li	a5,0
    1dd2:	4701                	li	a4,0
    1dd4:	4681                	li	a3,0
    1dd6:	2601                	sext.w	a2,a2
    1dd8:	1ec0006f          	j	1fc4 <__clone>

0000000000001ddc <exit>:
    register long a7 __asm__("a7") = n;
    1ddc:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1de0:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1de4:	8082                	ret

0000000000001de6 <waitpid>:
    register long a7 __asm__("a7") = n;
    1de6:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dea:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dec:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1df0:	2501                	sext.w	a0,a0
    1df2:	8082                	ret

0000000000001df4 <exec>:
    register long a7 __asm__("a7") = n;
    1df4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1df8:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <execve>:
    register long a7 __asm__("a7") = n;
    1e00:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e04:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <times>:
    register long a7 __asm__("a7") = n;
    1e0c:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e10:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <get_time>:

int64 get_time()
{
    1e18:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e1a:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e1e:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e20:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e22:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e26:	2501                	sext.w	a0,a0
    1e28:	ed09                	bnez	a0,1e42 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e2a:	67a2                	ld	a5,8(sp)
    1e2c:	3e800713          	li	a4,1000
    1e30:	00015503          	lhu	a0,0(sp)
    1e34:	02e7d7b3          	divu	a5,a5,a4
    1e38:	02e50533          	mul	a0,a0,a4
    1e3c:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e3e:	0141                	addi	sp,sp,16
    1e40:	8082                	ret
        return -1;
    1e42:	557d                	li	a0,-1
    1e44:	bfed                	j	1e3e <get_time+0x26>

0000000000001e46 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e46:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e4a:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <time>:
    register long a7 __asm__("a7") = n;
    1e52:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e56:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <sleep>:

int sleep(unsigned long long time)
{
    1e5e:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e60:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e62:	850a                	mv	a0,sp
    1e64:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e66:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e6a:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e70:	e501                	bnez	a0,1e78 <sleep+0x1a>
    return 0;
    1e72:	4501                	li	a0,0
}
    1e74:	0141                	addi	sp,sp,16
    1e76:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e78:	4502                	lw	a0,0(sp)
}
    1e7a:	0141                	addi	sp,sp,16
    1e7c:	8082                	ret

0000000000001e7e <set_priority>:
    register long a7 __asm__("a7") = n;
    1e7e:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e82:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e86:	2501                	sext.w	a0,a0
    1e88:	8082                	ret

0000000000001e8a <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e8a:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e8e:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e92:	8082                	ret

0000000000001e94 <munmap>:
    register long a7 __asm__("a7") = n;
    1e94:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e98:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <wait>:

int wait(int *code)
{
    1ea0:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ea2:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1ea6:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1ea8:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eaa:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eac:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1eb0:	2501                	sext.w	a0,a0
    1eb2:	8082                	ret

0000000000001eb4 <spawn>:
    register long a7 __asm__("a7") = n;
    1eb4:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eb8:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <mailread>:
    register long a7 __asm__("a7") = n;
    1ec0:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec4:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ecc:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <fstat>:
    register long a7 __asm__("a7") = n;
    1ed8:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1edc:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ee4:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ee6:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1eea:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eec:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ef4:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ef6:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1efa:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1efc:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f00:	2501                	sext.w	a0,a0
    1f02:	8082                	ret

0000000000001f04 <link>:

int link(char *old_path, char *new_path)
{
    1f04:	87aa                	mv	a5,a0
    1f06:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f08:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f0c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f10:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f12:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f16:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f18:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <unlink>:

int unlink(char *path)
{
    1f20:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f22:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f26:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f2a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f2c:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <uname>:
    register long a7 __asm__("a7") = n;
    1f34:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f38:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <brk>:
    register long a7 __asm__("a7") = n;
    1f40:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f44:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <getcwd>:
    register long a7 __asm__("a7") = n;
    1f4c:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f4e:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f52:	8082                	ret

0000000000001f54 <chdir>:
    register long a7 __asm__("a7") = n;
    1f54:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f58:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f60:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f62:	02059613          	slli	a2,a1,0x20
    1f66:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f68:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f6c:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f70:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f72:	00000073          	ecall
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <getdents>:
    register long a7 __asm__("a7") = n;
    1f7a:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7e:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <pipe>:
    register long a7 __asm__("a7") = n;
    1f86:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f8a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f8c:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <dup>:
    register long a7 __asm__("a7") = n;
    1f94:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f96:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f9a:	2501                	sext.w	a0,a0
    1f9c:	8082                	ret

0000000000001f9e <dup2>:
    register long a7 __asm__("a7") = n;
    1f9e:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fa0:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fa2:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <mount>:
    register long a7 __asm__("a7") = n;
    1faa:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fae:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <umount>:
    register long a7 __asm__("a7") = n;
    1fb6:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fba:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fbc:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fc0:	2501                	sext.w	a0,a0
    1fc2:	8082                	ret

0000000000001fc4 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fc4:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fc6:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fc8:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fca:	8532                	mv	a0,a2
	mv a2, a4
    1fcc:	863a                	mv	a2,a4
	mv a3, a5
    1fce:	86be                	mv	a3,a5
	mv a4, a6
    1fd0:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fd2:	0dc00893          	li	a7,220
	ecall
    1fd6:	00000073          	ecall

	beqz a0, 1f
    1fda:	c111                	beqz	a0,1fde <__clone+0x1a>
	# Parent
	ret
    1fdc:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fde:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fe0:	6522                	ld	a0,8(sp)
	jalr a1
    1fe2:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fe4:	05d00893          	li	a7,93
	ecall
    1fe8:	00000073          	ecall
