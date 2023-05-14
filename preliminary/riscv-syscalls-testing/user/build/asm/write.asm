
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/write:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0980006f          	j	109a <__start_main>

0000000000001006 <test_write>:
#include "unistd.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

void test_write(){
    1006:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fd050513          	addi	a0,a0,-48 # 1fd8 <__clone+0x2e>
void test_write(){
    1010:	e406                	sd	ra,8(sp)
    1012:	e022                	sd	s0,0(sp)
	TEST_START(__func__);
    1014:	286000ef          	jal	ra,129a <puts>
    1018:	00001517          	auipc	a0,0x1
    101c:	06050513          	addi	a0,a0,96 # 2078 <__func__.1211>
    1020:	27a000ef          	jal	ra,129a <puts>
    1024:	00001517          	auipc	a0,0x1
    1028:	fcc50513          	addi	a0,a0,-52 # 1ff0 <__clone+0x46>
    102c:	26e000ef          	jal	ra,129a <puts>
	const char *str = "Hello operating system contest.\n";
	int str_len = strlen(str);
    1030:	00001517          	auipc	a0,0x1
    1034:	fd050513          	addi	a0,a0,-48 # 2000 <__clone+0x56>
    1038:	01d000ef          	jal	ra,1854 <strlen>
    103c:	0005041b          	sext.w	s0,a0
	assert(write(STDOUT, str, str_len) == str_len);
    1040:	8622                	mv	a2,s0
    1042:	00001597          	auipc	a1,0x1
    1046:	fbe58593          	addi	a1,a1,-66 # 2000 <__clone+0x56>
    104a:	4505                	li	a0,1
    104c:	525000ef          	jal	ra,1d70 <write>
    1050:	00850863          	beq	a0,s0,1060 <test_write+0x5a>
    1054:	00001517          	auipc	a0,0x1
    1058:	fd450513          	addi	a0,a0,-44 # 2028 <__clone+0x7e>
    105c:	504000ef          	jal	ra,1560 <panic>
	TEST_END(__func__);
    1060:	00001517          	auipc	a0,0x1
    1064:	fe850513          	addi	a0,a0,-24 # 2048 <__clone+0x9e>
    1068:	232000ef          	jal	ra,129a <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	00c50513          	addi	a0,a0,12 # 2078 <__func__.1211>
    1074:	226000ef          	jal	ra,129a <puts>
}
    1078:	6402                	ld	s0,0(sp)
    107a:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    107c:	00001517          	auipc	a0,0x1
    1080:	f7450513          	addi	a0,a0,-140 # 1ff0 <__clone+0x46>
}
    1084:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    1086:	2140006f          	j	129a <puts>

000000000000108a <main>:

int main(void) {
    108a:	1141                	addi	sp,sp,-16
    108c:	e406                	sd	ra,8(sp)
	test_write();
    108e:	f79ff0ef          	jal	ra,1006 <test_write>
	return 0;
}
    1092:	60a2                	ld	ra,8(sp)
    1094:	4501                	li	a0,0
    1096:	0141                	addi	sp,sp,16
    1098:	8082                	ret

000000000000109a <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109a:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    109c:	4108                	lw	a0,0(a0)
{
    109e:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10a0:	05a1                	addi	a1,a1,8
{
    10a2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a4:	fe7ff0ef          	jal	ra,108a <main>
    10a8:	51b000ef          	jal	ra,1dc2 <exit>
	return 0;
}
    10ac:	60a2                	ld	ra,8(sp)
    10ae:	4501                	li	a0,0
    10b0:	0141                	addi	sp,sp,16
    10b2:	8082                	ret

00000000000010b4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b4:	7179                	addi	sp,sp,-48
    10b6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10b8:	12054e63          	bltz	a0,11f4 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10bc:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10c0:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c2:	02b7f6bb          	remuw	a3,a5,a1
    10c6:	00001717          	auipc	a4,0x1
    10ca:	fc270713          	addi	a4,a4,-62 # 2088 <digits>
    buf[16] = 0;
    10ce:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10d2:	1682                	slli	a3,a3,0x20
    10d4:	9281                	srli	a3,a3,0x20
    10d6:	96ba                	add	a3,a3,a4
    10d8:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10dc:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10e0:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10e4:	16b7e363          	bltu	a5,a1,124a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10e8:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10ec:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10f0:	1602                	slli	a2,a2,0x20
    10f2:	9201                	srli	a2,a2,0x20
    10f4:	963a                	add	a2,a2,a4
    10f6:	00064603          	lbu	a2,0(a2)
    10fa:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10fe:	0007861b          	sext.w	a2,a5
    1102:	12b6e863          	bltu	a3,a1,1232 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1106:	02b7f6bb          	remuw	a3,a5,a1
    110a:	1682                	slli	a3,a3,0x20
    110c:	9281                	srli	a3,a3,0x20
    110e:	96ba                	add	a3,a3,a4
    1110:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1114:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1118:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    111c:	10b66e63          	bltu	a2,a1,1238 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1120:	02b876bb          	remuw	a3,a6,a1
    1124:	1682                	slli	a3,a3,0x20
    1126:	9281                	srli	a3,a3,0x20
    1128:	96ba                	add	a3,a3,a4
    112a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    112e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1132:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1136:	10b86463          	bltu	a6,a1,123e <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    113a:	02b676bb          	remuw	a3,a2,a1
    113e:	1682                	slli	a3,a3,0x20
    1140:	9281                	srli	a3,a3,0x20
    1142:	96ba                	add	a3,a3,a4
    1144:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1148:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    114c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1150:	0eb66a63          	bltu	a2,a1,1244 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1154:	02b876bb          	remuw	a3,a6,a1
    1158:	1682                	slli	a3,a3,0x20
    115a:	9281                	srli	a3,a3,0x20
    115c:	96ba                	add	a3,a3,a4
    115e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1162:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1166:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    116a:	0cb86163          	bltu	a6,a1,122c <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    116e:	02b676bb          	remuw	a3,a2,a1
    1172:	1682                	slli	a3,a3,0x20
    1174:	9281                	srli	a3,a3,0x20
    1176:	96ba                	add	a3,a3,a4
    1178:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1180:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1184:	0cb66563          	bltu	a2,a1,124e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1188:	02b876bb          	remuw	a3,a6,a1
    118c:	1682                	slli	a3,a3,0x20
    118e:	9281                	srli	a3,a3,0x20
    1190:	96ba                	add	a3,a3,a4
    1192:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1196:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    119a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    119e:	0ab86b63          	bltu	a6,a1,1254 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11a2:	02b676bb          	remuw	a3,a2,a1
    11a6:	1682                	slli	a3,a3,0x20
    11a8:	9281                	srli	a3,a3,0x20
    11aa:	96ba                	add	a3,a3,a4
    11ac:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b0:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11b4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11b8:	0ab66163          	bltu	a2,a1,125a <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11bc:	1782                	slli	a5,a5,0x20
    11be:	9381                	srli	a5,a5,0x20
    11c0:	97ba                	add	a5,a5,a4
    11c2:	0007c703          	lbu	a4,0(a5)
    11c6:	4599                	li	a1,6
    11c8:	4795                	li	a5,5
    11ca:	00e10723          	sb	a4,14(sp)

    if (sign)
    11ce:	00055963          	bgez	a0,11e0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d2:	1018                	addi	a4,sp,32
    11d4:	973e                	add	a4,a4,a5
    11d6:	02d00693          	li	a3,45
    11da:	fed70423          	sb	a3,-24(a4)
    11de:	85be                	mv	a1,a5
    write(f, s, l);
    11e0:	003c                	addi	a5,sp,8
    11e2:	4641                	li	a2,16
    11e4:	9e0d                	subw	a2,a2,a1
    11e6:	4505                	li	a0,1
    11e8:	95be                	add	a1,a1,a5
    11ea:	387000ef          	jal	ra,1d70 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11ee:	70a2                	ld	ra,40(sp)
    11f0:	6145                	addi	sp,sp,48
    11f2:	8082                	ret
        x = -xx;
    11f4:	40a0063b          	negw	a2,a0
    11f8:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11fa:	02b677bb          	remuw	a5,a2,a1
    11fe:	00001717          	auipc	a4,0x1
    1202:	e8a70713          	addi	a4,a4,-374 # 2088 <digits>
    buf[16] = 0;
    1206:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    120a:	1782                	slli	a5,a5,0x20
    120c:	9381                	srli	a5,a5,0x20
    120e:	97ba                	add	a5,a5,a4
    1210:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1214:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1218:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    121c:	ecb676e3          	bleu	a1,a2,10e8 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1220:	02d00793          	li	a5,45
    1224:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1228:	45b9                	li	a1,14
    122a:	bf5d                	j	11e0 <printint.constprop.0+0x12c>
    122c:	47a5                	li	a5,9
    122e:	45a9                	li	a1,10
    1230:	bf79                	j	11ce <printint.constprop.0+0x11a>
    1232:	47b5                	li	a5,13
    1234:	45b9                	li	a1,14
    1236:	bf61                	j	11ce <printint.constprop.0+0x11a>
    1238:	47b1                	li	a5,12
    123a:	45b5                	li	a1,13
    123c:	bf49                	j	11ce <printint.constprop.0+0x11a>
    123e:	47ad                	li	a5,11
    1240:	45b1                	li	a1,12
    1242:	b771                	j	11ce <printint.constprop.0+0x11a>
    1244:	47a9                	li	a5,10
    1246:	45ad                	li	a1,11
    1248:	b759                	j	11ce <printint.constprop.0+0x11a>
    i = 15;
    124a:	45bd                	li	a1,15
    124c:	bf51                	j	11e0 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    124e:	47a1                	li	a5,8
    1250:	45a5                	li	a1,9
    1252:	bfb5                	j	11ce <printint.constprop.0+0x11a>
    1254:	479d                	li	a5,7
    1256:	45a1                	li	a1,8
    1258:	bf9d                	j	11ce <printint.constprop.0+0x11a>
    125a:	4799                	li	a5,6
    125c:	459d                	li	a1,7
    125e:	bf85                	j	11ce <printint.constprop.0+0x11a>

0000000000001260 <getchar>:
{
    1260:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1262:	00f10593          	addi	a1,sp,15
    1266:	4605                	li	a2,1
    1268:	4501                	li	a0,0
{
    126a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    126c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1270:	2f7000ef          	jal	ra,1d66 <read>
}
    1274:	60e2                	ld	ra,24(sp)
    1276:	00f14503          	lbu	a0,15(sp)
    127a:	6105                	addi	sp,sp,32
    127c:	8082                	ret

000000000000127e <putchar>:
{
    127e:	1101                	addi	sp,sp,-32
    char byte = c;
    1280:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1284:	00f10593          	addi	a1,sp,15
    1288:	4605                	li	a2,1
    128a:	4505                	li	a0,1
{
    128c:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    128e:	2e3000ef          	jal	ra,1d70 <write>
}
    1292:	60e2                	ld	ra,24(sp)
    1294:	2501                	sext.w	a0,a0
    1296:	6105                	addi	sp,sp,32
    1298:	8082                	ret

000000000000129a <puts>:
{
    129a:	1141                	addi	sp,sp,-16
    129c:	e406                	sd	ra,8(sp)
    129e:	e022                	sd	s0,0(sp)
    12a0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12a2:	5b2000ef          	jal	ra,1854 <strlen>
    12a6:	862a                	mv	a2,a0
    12a8:	85a2                	mv	a1,s0
    12aa:	4505                	li	a0,1
    12ac:	2c5000ef          	jal	ra,1d70 <write>
}
    12b0:	60a2                	ld	ra,8(sp)
    12b2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12b4:	957d                	srai	a0,a0,0x3f
    return r;
    12b6:	2501                	sext.w	a0,a0
}
    12b8:	0141                	addi	sp,sp,16
    12ba:	8082                	ret

00000000000012bc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12bc:	7131                	addi	sp,sp,-192
    12be:	e0da                	sd	s6,64(sp)
    12c0:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12c2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12c4:	013c                	addi	a5,sp,136
{
    12c6:	f0ca                	sd	s2,96(sp)
    12c8:	ecce                	sd	s3,88(sp)
    12ca:	e8d2                	sd	s4,80(sp)
    12cc:	e4d6                	sd	s5,72(sp)
    12ce:	fc5e                	sd	s7,56(sp)
    12d0:	fc86                	sd	ra,120(sp)
    12d2:	f8a2                	sd	s0,112(sp)
    12d4:	f4a6                	sd	s1,104(sp)
    12d6:	89aa                	mv	s3,a0
    12d8:	e52e                	sd	a1,136(sp)
    12da:	e932                	sd	a2,144(sp)
    12dc:	ed36                	sd	a3,152(sp)
    12de:	f13a                	sd	a4,160(sp)
    12e0:	f942                	sd	a6,176(sp)
    12e2:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12e4:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12e6:	02500913          	li	s2,37
    12ea:	07000a93          	li	s5,112
    buf[i++] = '0';
    12ee:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f2:	00001a17          	auipc	s4,0x1
    12f6:	d96a0a13          	addi	s4,s4,-618 # 2088 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12fa:	00001b97          	auipc	s7,0x1
    12fe:	d5eb8b93          	addi	s7,s7,-674 # 2058 <__clone+0xae>
        if (!*s)
    1302:	0009c783          	lbu	a5,0(s3)
    1306:	cfb9                	beqz	a5,1364 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1308:	23278d63          	beq	a5,s2,1542 <printf+0x286>
    130c:	864e                	mv	a2,s3
    130e:	a019                	j	1314 <printf+0x58>
    1310:	07278563          	beq	a5,s2,137a <printf+0xbe>
    1314:	0605                	addi	a2,a2,1
    1316:	00064783          	lbu	a5,0(a2)
    131a:	fbfd                	bnez	a5,1310 <printf+0x54>
    131c:	84b2                	mv	s1,a2
        l = z - a;
    131e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1322:	8622                	mv	a2,s0
    1324:	85ce                	mv	a1,s3
    1326:	4505                	li	a0,1
    1328:	249000ef          	jal	ra,1d70 <write>
        if (l)
    132c:	ec3d                	bnez	s0,13aa <printf+0xee>
        if (s[1] == 0)
    132e:	0014c783          	lbu	a5,1(s1)
    1332:	cb8d                	beqz	a5,1364 <printf+0xa8>
        switch (s[1])
    1334:	09578b63          	beq	a5,s5,13ca <printf+0x10e>
    1338:	06fafb63          	bleu	a5,s5,13ae <printf+0xf2>
    133c:	07300713          	li	a4,115
    1340:	1ce78e63          	beq	a5,a4,151c <printf+0x260>
    1344:	07800713          	li	a4,120
    1348:	1ae79563          	bne	a5,a4,14f2 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    134c:	6782                	ld	a5,0(sp)
    134e:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1350:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1354:	4388                	lw	a0,0(a5)
    1356:	07a1                	addi	a5,a5,8
    1358:	e03e                	sd	a5,0(sp)
    135a:	d5bff0ef          	jal	ra,10b4 <printint.constprop.0>
        if (!*s)
    135e:	0009c783          	lbu	a5,0(s3)
    1362:	f3dd                	bnez	a5,1308 <printf+0x4c>
    }
    va_end(ap);
}
    1364:	70e6                	ld	ra,120(sp)
    1366:	7446                	ld	s0,112(sp)
    1368:	74a6                	ld	s1,104(sp)
    136a:	7906                	ld	s2,96(sp)
    136c:	69e6                	ld	s3,88(sp)
    136e:	6a46                	ld	s4,80(sp)
    1370:	6aa6                	ld	s5,72(sp)
    1372:	6b06                	ld	s6,64(sp)
    1374:	7be2                	ld	s7,56(sp)
    1376:	6129                	addi	sp,sp,192
    1378:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    137a:	00164783          	lbu	a5,1(a2)
    137e:	84b2                	mv	s1,a2
    1380:	01278763          	beq	a5,s2,138e <printf+0xd2>
    1384:	bf69                	j	131e <printf+0x62>
    1386:	0014c783          	lbu	a5,1(s1)
    138a:	f9279ae3          	bne	a5,s2,131e <printf+0x62>
    138e:	0489                	addi	s1,s1,2
    1390:	0004c783          	lbu	a5,0(s1)
    1394:	0605                	addi	a2,a2,1
    1396:	ff2788e3          	beq	a5,s2,1386 <printf+0xca>
        l = z - a;
    139a:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    139e:	8622                	mv	a2,s0
    13a0:	85ce                	mv	a1,s3
    13a2:	4505                	li	a0,1
    13a4:	1cd000ef          	jal	ra,1d70 <write>
        if (l)
    13a8:	d059                	beqz	s0,132e <printf+0x72>
    13aa:	89a6                	mv	s3,s1
    13ac:	bf99                	j	1302 <printf+0x46>
    13ae:	06400713          	li	a4,100
    13b2:	14e79063          	bne	a5,a4,14f2 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13b6:	6782                	ld	a5,0(sp)
    13b8:	45a9                	li	a1,10
        s += 2;
    13ba:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13be:	4388                	lw	a0,0(a5)
    13c0:	07a1                	addi	a5,a5,8
    13c2:	e03e                	sd	a5,0(sp)
    13c4:	cf1ff0ef          	jal	ra,10b4 <printint.constprop.0>
        s += 2;
    13c8:	bf59                	j	135e <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13ca:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13cc:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d2:	631c                	ld	a5,0(a4)
    13d4:	0721                	addi	a4,a4,8
    13d6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13d8:	00479293          	slli	t0,a5,0x4
    13dc:	00879f93          	slli	t6,a5,0x8
    13e0:	00c79f13          	slli	t5,a5,0xc
    13e4:	01079e93          	slli	t4,a5,0x10
    13e8:	01479e13          	slli	t3,a5,0x14
    13ec:	01879313          	slli	t1,a5,0x18
    13f0:	01c79893          	slli	a7,a5,0x1c
    13f4:	02479813          	slli	a6,a5,0x24
    13f8:	02879513          	slli	a0,a5,0x28
    13fc:	02c79593          	slli	a1,a5,0x2c
    1400:	03079693          	slli	a3,a5,0x30
    1404:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1408:	03c7d413          	srli	s0,a5,0x3c
    140c:	01c7d39b          	srliw	t2,a5,0x1c
    1410:	03c2d293          	srli	t0,t0,0x3c
    1414:	03cfdf93          	srli	t6,t6,0x3c
    1418:	03cf5f13          	srli	t5,t5,0x3c
    141c:	03cede93          	srli	t4,t4,0x3c
    1420:	03ce5e13          	srli	t3,t3,0x3c
    1424:	03c35313          	srli	t1,t1,0x3c
    1428:	03c8d893          	srli	a7,a7,0x3c
    142c:	03c85813          	srli	a6,a6,0x3c
    1430:	9171                	srli	a0,a0,0x3c
    1432:	91f1                	srli	a1,a1,0x3c
    1434:	92f1                	srli	a3,a3,0x3c
    1436:	9371                	srli	a4,a4,0x3c
    1438:	96d2                	add	a3,a3,s4
    143a:	9752                	add	a4,a4,s4
    143c:	9452                	add	s0,s0,s4
    143e:	92d2                	add	t0,t0,s4
    1440:	9fd2                	add	t6,t6,s4
    1442:	9f52                	add	t5,t5,s4
    1444:	9ed2                	add	t4,t4,s4
    1446:	9e52                	add	t3,t3,s4
    1448:	9352                	add	t1,t1,s4
    144a:	98d2                	add	a7,a7,s4
    144c:	93d2                	add	t2,t2,s4
    144e:	9852                	add	a6,a6,s4
    1450:	9552                	add	a0,a0,s4
    1452:	95d2                	add	a1,a1,s4
    1454:	0006c983          	lbu	s3,0(a3)
    1458:	0002c283          	lbu	t0,0(t0)
    145c:	00074683          	lbu	a3,0(a4)
    1460:	000fcf83          	lbu	t6,0(t6)
    1464:	000f4f03          	lbu	t5,0(t5)
    1468:	000ece83          	lbu	t4,0(t4)
    146c:	000e4e03          	lbu	t3,0(t3)
    1470:	00034303          	lbu	t1,0(t1)
    1474:	0008c883          	lbu	a7,0(a7)
    1478:	0003c383          	lbu	t2,0(t2)
    147c:	00084803          	lbu	a6,0(a6)
    1480:	00054503          	lbu	a0,0(a0)
    1484:	0005c583          	lbu	a1,0(a1)
    1488:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    148c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1490:	9371                	srli	a4,a4,0x3c
    1492:	8bbd                	andi	a5,a5,15
    1494:	9752                	add	a4,a4,s4
    1496:	97d2                	add	a5,a5,s4
    1498:	005105a3          	sb	t0,11(sp)
    149c:	01f10623          	sb	t6,12(sp)
    14a0:	01e106a3          	sb	t5,13(sp)
    14a4:	01d10723          	sb	t4,14(sp)
    14a8:	01c107a3          	sb	t3,15(sp)
    14ac:	00610823          	sb	t1,16(sp)
    14b0:	011108a3          	sb	a7,17(sp)
    14b4:	00710923          	sb	t2,18(sp)
    14b8:	010109a3          	sb	a6,19(sp)
    14bc:	00a10a23          	sb	a0,20(sp)
    14c0:	00b10aa3          	sb	a1,21(sp)
    14c4:	01310b23          	sb	s3,22(sp)
    14c8:	00d10ba3          	sb	a3,23(sp)
    14cc:	00810523          	sb	s0,10(sp)
    14d0:	00074703          	lbu	a4,0(a4)
    14d4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14d8:	002c                	addi	a1,sp,8
    14da:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14dc:	00e10c23          	sb	a4,24(sp)
    14e0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e4:	00010d23          	sb	zero,26(sp)
        s += 2;
    14e8:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14ec:	085000ef          	jal	ra,1d70 <write>
        s += 2;
    14f0:	b5bd                	j	135e <printf+0xa2>
    char byte = c;
    14f2:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14f6:	4605                	li	a2,1
    14f8:	002c                	addi	a1,sp,8
    14fa:	4505                	li	a0,1
    char byte = c;
    14fc:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1500:	071000ef          	jal	ra,1d70 <write>
    char byte = c;
    1504:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1508:	4605                	li	a2,1
    150a:	002c                	addi	a1,sp,8
    150c:	4505                	li	a0,1
    char byte = c;
    150e:	00f10423          	sb	a5,8(sp)
        s += 2;
    1512:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1516:	05b000ef          	jal	ra,1d70 <write>
        s += 2;
    151a:	b591                	j	135e <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    151c:	6782                	ld	a5,0(sp)
    151e:	6380                	ld	s0,0(a5)
    1520:	07a1                	addi	a5,a5,8
    1522:	e03e                	sd	a5,0(sp)
    1524:	cc05                	beqz	s0,155c <printf+0x2a0>
            l = strnlen(a, 200);
    1526:	0c800593          	li	a1,200
    152a:	8522                	mv	a0,s0
    152c:	45a000ef          	jal	ra,1986 <strnlen>
    write(f, s, l);
    1530:	0005061b          	sext.w	a2,a0
    1534:	85a2                	mv	a1,s0
    1536:	4505                	li	a0,1
    1538:	039000ef          	jal	ra,1d70 <write>
        s += 2;
    153c:	00248993          	addi	s3,s1,2
    1540:	bd39                	j	135e <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1542:	0019c783          	lbu	a5,1(s3)
    1546:	84ce                	mv	s1,s3
    1548:	864e                	mv	a2,s3
    154a:	e52782e3          	beq	a5,s2,138e <printf+0xd2>
    write(f, s, l);
    154e:	4601                	li	a2,0
    1550:	85ce                	mv	a1,s3
    1552:	4505                	li	a0,1
    1554:	01d000ef          	jal	ra,1d70 <write>
    1558:	84ce                	mv	s1,s3
    155a:	bbd1                	j	132e <printf+0x72>
                a = "(null)";
    155c:	845e                	mv	s0,s7
    155e:	b7e1                	j	1526 <printf+0x26a>

0000000000001560 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1560:	1141                	addi	sp,sp,-16
    1562:	e406                	sd	ra,8(sp)
    puts(m);
    1564:	d37ff0ef          	jal	ra,129a <puts>
    exit(-100);
}
    1568:	60a2                	ld	ra,8(sp)
    exit(-100);
    156a:	f9c00513          	li	a0,-100
}
    156e:	0141                	addi	sp,sp,16
    exit(-100);
    1570:	0530006f          	j	1dc2 <exit>

0000000000001574 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1574:	02000793          	li	a5,32
    1578:	00f50663          	beq	a0,a5,1584 <isspace+0x10>
    157c:	355d                	addiw	a0,a0,-9
    157e:	00553513          	sltiu	a0,a0,5
    1582:	8082                	ret
    1584:	4505                	li	a0,1
}
    1586:	8082                	ret

0000000000001588 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1588:	fd05051b          	addiw	a0,a0,-48
}
    158c:	00a53513          	sltiu	a0,a0,10
    1590:	8082                	ret

0000000000001592 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1592:	02000613          	li	a2,32
    1596:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1598:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    159c:	0007079b          	sext.w	a5,a4
    15a0:	ff77869b          	addiw	a3,a5,-9
    15a4:	04c70b63          	beq	a4,a2,15fa <atoi+0x68>
    15a8:	04d5f963          	bleu	a3,a1,15fa <atoi+0x68>
        s++;
    switch (*s)
    15ac:	02b00693          	li	a3,43
    15b0:	04d70a63          	beq	a4,a3,1604 <atoi+0x72>
    15b4:	02d00693          	li	a3,45
    15b8:	06d70463          	beq	a4,a3,1620 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15bc:	fd07859b          	addiw	a1,a5,-48
    15c0:	4625                	li	a2,9
    15c2:	873e                	mv	a4,a5
    15c4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15c6:	4e01                	li	t3,0
    while (isdigit(*s))
    15c8:	04b66a63          	bltu	a2,a1,161c <atoi+0x8a>
    int n = 0, neg = 0;
    15cc:	4501                	li	a0,0
    while (isdigit(*s))
    15ce:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15d0:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15d2:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15d6:	0025179b          	slliw	a5,a0,0x2
    15da:	9d3d                	addw	a0,a0,a5
    15dc:	fd07031b          	addiw	t1,a4,-48
    15e0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15e4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15e8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15ec:	0006071b          	sext.w	a4,a2
    15f0:	feb870e3          	bleu	a1,a6,15d0 <atoi+0x3e>
    return neg ? n : -n;
    15f4:	000e0563          	beqz	t3,15fe <atoi+0x6c>
}
    15f8:	8082                	ret
        s++;
    15fa:	0505                	addi	a0,a0,1
    15fc:	bf71                	j	1598 <atoi+0x6>
    15fe:	4113053b          	subw	a0,t1,a7
    1602:	8082                	ret
    while (isdigit(*s))
    1604:	00154783          	lbu	a5,1(a0)
    1608:	4625                	li	a2,9
        s++;
    160a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    160e:	fd07859b          	addiw	a1,a5,-48
    1612:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1616:	4e01                	li	t3,0
    while (isdigit(*s))
    1618:	fab67ae3          	bleu	a1,a2,15cc <atoi+0x3a>
    161c:	4501                	li	a0,0
}
    161e:	8082                	ret
    while (isdigit(*s))
    1620:	00154783          	lbu	a5,1(a0)
    1624:	4625                	li	a2,9
        s++;
    1626:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    162a:	fd07859b          	addiw	a1,a5,-48
    162e:	0007871b          	sext.w	a4,a5
    1632:	feb665e3          	bltu	a2,a1,161c <atoi+0x8a>
        neg = 1;
    1636:	4e05                	li	t3,1
    1638:	bf51                	j	15cc <atoi+0x3a>

000000000000163a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    163a:	16060d63          	beqz	a2,17b4 <memset+0x17a>
    163e:	40a007b3          	neg	a5,a0
    1642:	8b9d                	andi	a5,a5,7
    1644:	00778713          	addi	a4,a5,7
    1648:	482d                	li	a6,11
    164a:	0ff5f593          	andi	a1,a1,255
    164e:	fff60693          	addi	a3,a2,-1
    1652:	17076263          	bltu	a4,a6,17b6 <memset+0x17c>
    1656:	16e6ea63          	bltu	a3,a4,17ca <memset+0x190>
    165a:	16078563          	beqz	a5,17c4 <memset+0x18a>
    165e:	00b50023          	sb	a1,0(a0)
    1662:	4705                	li	a4,1
    1664:	00150e93          	addi	t4,a0,1
    1668:	14e78c63          	beq	a5,a4,17c0 <memset+0x186>
    166c:	00b500a3          	sb	a1,1(a0)
    1670:	4709                	li	a4,2
    1672:	00250e93          	addi	t4,a0,2
    1676:	14e78d63          	beq	a5,a4,17d0 <memset+0x196>
    167a:	00b50123          	sb	a1,2(a0)
    167e:	470d                	li	a4,3
    1680:	00350e93          	addi	t4,a0,3
    1684:	12e78b63          	beq	a5,a4,17ba <memset+0x180>
    1688:	00b501a3          	sb	a1,3(a0)
    168c:	4711                	li	a4,4
    168e:	00450e93          	addi	t4,a0,4
    1692:	14e78163          	beq	a5,a4,17d4 <memset+0x19a>
    1696:	00b50223          	sb	a1,4(a0)
    169a:	4715                	li	a4,5
    169c:	00550e93          	addi	t4,a0,5
    16a0:	12e78c63          	beq	a5,a4,17d8 <memset+0x19e>
    16a4:	00b502a3          	sb	a1,5(a0)
    16a8:	471d                	li	a4,7
    16aa:	00650e93          	addi	t4,a0,6
    16ae:	12e79763          	bne	a5,a4,17dc <memset+0x1a2>
    16b2:	00750e93          	addi	t4,a0,7
    16b6:	00b50323          	sb	a1,6(a0)
    16ba:	4f1d                	li	t5,7
    16bc:	00859713          	slli	a4,a1,0x8
    16c0:	8f4d                	or	a4,a4,a1
    16c2:	01059e13          	slli	t3,a1,0x10
    16c6:	01c76e33          	or	t3,a4,t3
    16ca:	01859313          	slli	t1,a1,0x18
    16ce:	006e6333          	or	t1,t3,t1
    16d2:	02059893          	slli	a7,a1,0x20
    16d6:	011368b3          	or	a7,t1,a7
    16da:	02859813          	slli	a6,a1,0x28
    16de:	40f60333          	sub	t1,a2,a5
    16e2:	0108e833          	or	a6,a7,a6
    16e6:	03059693          	slli	a3,a1,0x30
    16ea:	00d866b3          	or	a3,a6,a3
    16ee:	03859713          	slli	a4,a1,0x38
    16f2:	97aa                	add	a5,a5,a0
    16f4:	ff837813          	andi	a6,t1,-8
    16f8:	8f55                	or	a4,a4,a3
    16fa:	00f806b3          	add	a3,a6,a5
    16fe:	e398                	sd	a4,0(a5)
    1700:	07a1                	addi	a5,a5,8
    1702:	fed79ee3          	bne	a5,a3,16fe <memset+0xc4>
    1706:	ff837693          	andi	a3,t1,-8
    170a:	00de87b3          	add	a5,t4,a3
    170e:	01e6873b          	addw	a4,a3,t5
    1712:	0ad30663          	beq	t1,a3,17be <memset+0x184>
    1716:	00b78023          	sb	a1,0(a5)
    171a:	0017069b          	addiw	a3,a4,1
    171e:	08c6fb63          	bleu	a2,a3,17b4 <memset+0x17a>
    1722:	00b780a3          	sb	a1,1(a5)
    1726:	0027069b          	addiw	a3,a4,2
    172a:	08c6f563          	bleu	a2,a3,17b4 <memset+0x17a>
    172e:	00b78123          	sb	a1,2(a5)
    1732:	0037069b          	addiw	a3,a4,3
    1736:	06c6ff63          	bleu	a2,a3,17b4 <memset+0x17a>
    173a:	00b781a3          	sb	a1,3(a5)
    173e:	0047069b          	addiw	a3,a4,4
    1742:	06c6f963          	bleu	a2,a3,17b4 <memset+0x17a>
    1746:	00b78223          	sb	a1,4(a5)
    174a:	0057069b          	addiw	a3,a4,5
    174e:	06c6f363          	bleu	a2,a3,17b4 <memset+0x17a>
    1752:	00b782a3          	sb	a1,5(a5)
    1756:	0067069b          	addiw	a3,a4,6
    175a:	04c6fd63          	bleu	a2,a3,17b4 <memset+0x17a>
    175e:	00b78323          	sb	a1,6(a5)
    1762:	0077069b          	addiw	a3,a4,7
    1766:	04c6f763          	bleu	a2,a3,17b4 <memset+0x17a>
    176a:	00b783a3          	sb	a1,7(a5)
    176e:	0087069b          	addiw	a3,a4,8
    1772:	04c6f163          	bleu	a2,a3,17b4 <memset+0x17a>
    1776:	00b78423          	sb	a1,8(a5)
    177a:	0097069b          	addiw	a3,a4,9
    177e:	02c6fb63          	bleu	a2,a3,17b4 <memset+0x17a>
    1782:	00b784a3          	sb	a1,9(a5)
    1786:	00a7069b          	addiw	a3,a4,10
    178a:	02c6f563          	bleu	a2,a3,17b4 <memset+0x17a>
    178e:	00b78523          	sb	a1,10(a5)
    1792:	00b7069b          	addiw	a3,a4,11
    1796:	00c6ff63          	bleu	a2,a3,17b4 <memset+0x17a>
    179a:	00b785a3          	sb	a1,11(a5)
    179e:	00c7069b          	addiw	a3,a4,12
    17a2:	00c6f963          	bleu	a2,a3,17b4 <memset+0x17a>
    17a6:	00b78623          	sb	a1,12(a5)
    17aa:	2735                	addiw	a4,a4,13
    17ac:	00c77463          	bleu	a2,a4,17b4 <memset+0x17a>
    17b0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17b4:	8082                	ret
    17b6:	472d                	li	a4,11
    17b8:	bd79                	j	1656 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ba:	4f0d                	li	t5,3
    17bc:	b701                	j	16bc <memset+0x82>
    17be:	8082                	ret
    17c0:	4f05                	li	t5,1
    17c2:	bded                	j	16bc <memset+0x82>
    17c4:	8eaa                	mv	t4,a0
    17c6:	4f01                	li	t5,0
    17c8:	bdd5                	j	16bc <memset+0x82>
    17ca:	87aa                	mv	a5,a0
    17cc:	4701                	li	a4,0
    17ce:	b7a1                	j	1716 <memset+0xdc>
    17d0:	4f09                	li	t5,2
    17d2:	b5ed                	j	16bc <memset+0x82>
    17d4:	4f11                	li	t5,4
    17d6:	b5dd                	j	16bc <memset+0x82>
    17d8:	4f15                	li	t5,5
    17da:	b5cd                	j	16bc <memset+0x82>
    17dc:	4f19                	li	t5,6
    17de:	bdf9                	j	16bc <memset+0x82>

00000000000017e0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17e0:	00054703          	lbu	a4,0(a0)
    17e4:	0005c783          	lbu	a5,0(a1)
    17e8:	00e79b63          	bne	a5,a4,17fe <strcmp+0x1e>
    17ec:	cf89                	beqz	a5,1806 <strcmp+0x26>
    17ee:	0505                	addi	a0,a0,1
    17f0:	0585                	addi	a1,a1,1
    17f2:	0005c783          	lbu	a5,0(a1)
    17f6:	00054703          	lbu	a4,0(a0)
    17fa:	fef709e3          	beq	a4,a5,17ec <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    17fe:	0007051b          	sext.w	a0,a4
}
    1802:	9d1d                	subw	a0,a0,a5
    1804:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1806:	4501                	li	a0,0
}
    1808:	9d1d                	subw	a0,a0,a5
    180a:	8082                	ret

000000000000180c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    180c:	c231                	beqz	a2,1850 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180e:	00054783          	lbu	a5,0(a0)
    1812:	0005c683          	lbu	a3,0(a1)
    1816:	c795                	beqz	a5,1842 <strncmp+0x36>
    1818:	ca85                	beqz	a3,1848 <strncmp+0x3c>
    if (!n--)
    181a:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181c:	c615                	beqz	a2,1848 <strncmp+0x3c>
    181e:	00150713          	addi	a4,a0,1
    1822:	9532                	add	a0,a0,a2
    1824:	00d78963          	beq	a5,a3,1836 <strncmp+0x2a>
    1828:	a005                	j	1848 <strncmp+0x3c>
    182a:	ce99                	beqz	a3,1848 <strncmp+0x3c>
    182c:	00e50e63          	beq	a0,a4,1848 <strncmp+0x3c>
    1830:	0705                	addi	a4,a4,1
    1832:	00d79b63          	bne	a5,a3,1848 <strncmp+0x3c>
    1836:	00074783          	lbu	a5,0(a4)
    183a:	0585                	addi	a1,a1,1
    183c:	0005c683          	lbu	a3,0(a1)
    1840:	f7ed                	bnez	a5,182a <strncmp+0x1e>
    1842:	4501                	li	a0,0
        ;
    return *l - *r;
    1844:	9d15                	subw	a0,a0,a3
    1846:	8082                	ret
    1848:	0007851b          	sext.w	a0,a5
    184c:	9d15                	subw	a0,a0,a3
    184e:	8082                	ret
        return 0;
    1850:	4501                	li	a0,0
}
    1852:	8082                	ret

0000000000001854 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1854:	00757793          	andi	a5,a0,7
    1858:	cfa1                	beqz	a5,18b0 <strlen+0x5c>
        if (!*s)
    185a:	00054783          	lbu	a5,0(a0)
    185e:	cbb9                	beqz	a5,18b4 <strlen+0x60>
    1860:	87aa                	mv	a5,a0
    1862:	a021                	j	186a <strlen+0x16>
    1864:	0007c703          	lbu	a4,0(a5)
    1868:	c329                	beqz	a4,18aa <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    186a:	0785                	addi	a5,a5,1
    186c:	0077f713          	andi	a4,a5,7
    1870:	fb75                	bnez	a4,1864 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1872:	00000717          	auipc	a4,0x0
    1876:	7ee70713          	addi	a4,a4,2030 # 2060 <__clone+0xb6>
    187a:	630c                	ld	a1,0(a4)
    187c:	00000717          	auipc	a4,0x0
    1880:	7ec70713          	addi	a4,a4,2028 # 2068 <__clone+0xbe>
    1884:	6394                	ld	a3,0(a5)
    1886:	6310                	ld	a2,0(a4)
    1888:	a019                	j	188e <strlen+0x3a>
    188a:	07a1                	addi	a5,a5,8
    188c:	6394                	ld	a3,0(a5)
    188e:	00b68733          	add	a4,a3,a1
    1892:	fff6c693          	not	a3,a3
    1896:	8f75                	and	a4,a4,a3
    1898:	8f71                	and	a4,a4,a2
    189a:	db65                	beqz	a4,188a <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    189c:	0007c703          	lbu	a4,0(a5)
    18a0:	c709                	beqz	a4,18aa <strlen+0x56>
    18a2:	0785                	addi	a5,a5,1
    18a4:	0007c703          	lbu	a4,0(a5)
    18a8:	ff6d                	bnez	a4,18a2 <strlen+0x4e>
        ;
    return s - a;
    18aa:	40a78533          	sub	a0,a5,a0
}
    18ae:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18b0:	87aa                	mv	a5,a0
    18b2:	b7c1                	j	1872 <strlen+0x1e>
        if (!*s)
    18b4:	4501                	li	a0,0
            return s - a;
    18b6:	8082                	ret

00000000000018b8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18b8:	00757793          	andi	a5,a0,7
    18bc:	0ff5f593          	andi	a1,a1,255
    18c0:	cb99                	beqz	a5,18d6 <memchr+0x1e>
    18c2:	c655                	beqz	a2,196e <memchr+0xb6>
    18c4:	00054783          	lbu	a5,0(a0)
    18c8:	0ab78663          	beq	a5,a1,1974 <memchr+0xbc>
    18cc:	0505                	addi	a0,a0,1
    18ce:	00757793          	andi	a5,a0,7
    18d2:	167d                	addi	a2,a2,-1
    18d4:	f7fd                	bnez	a5,18c2 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18d6:	4701                	li	a4,0
    if (n && *s != c)
    18d8:	ca49                	beqz	a2,196a <memchr+0xb2>
    18da:	00054783          	lbu	a5,0(a0)
    18de:	08b78b63          	beq	a5,a1,1974 <memchr+0xbc>
        size_t k = ONES * c;
    18e2:	00000797          	auipc	a5,0x0
    18e6:	78e78793          	addi	a5,a5,1934 # 2070 <__clone+0xc6>
    18ea:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18ec:	479d                	li	a5,7
        size_t k = ONES * c;
    18ee:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18f2:	08c7f863          	bleu	a2,a5,1982 <memchr+0xca>
    18f6:	611c                	ld	a5,0(a0)
    18f8:	00000317          	auipc	t1,0x0
    18fc:	77030313          	addi	t1,t1,1904 # 2068 <__clone+0xbe>
    1900:	00033803          	ld	a6,0(t1)
    1904:	00f8c7b3          	xor	a5,a7,a5
    1908:	fff7c713          	not	a4,a5
    190c:	8f95                	sub	a5,a5,a3
    190e:	8ff9                	and	a5,a5,a4
    1910:	0107f7b3          	and	a5,a5,a6
    1914:	e7bd                	bnez	a5,1982 <memchr+0xca>
    1916:	4e1d                	li	t3,7
    1918:	00000e97          	auipc	t4,0x0
    191c:	748e8e93          	addi	t4,t4,1864 # 2060 <__clone+0xb6>
    1920:	a005                	j	1940 <memchr+0x88>
    1922:	6514                	ld	a3,8(a0)
    1924:	000eb783          	ld	a5,0(t4)
    1928:	00033803          	ld	a6,0(t1)
    192c:	00d8c6b3          	xor	a3,a7,a3
    1930:	97b6                	add	a5,a5,a3
    1932:	fff6c693          	not	a3,a3
    1936:	8ff5                	and	a5,a5,a3
    1938:	0107f7b3          	and	a5,a5,a6
    193c:	e3a1                	bnez	a5,197c <memchr+0xc4>
    193e:	853a                	mv	a0,a4
    1940:	1661                	addi	a2,a2,-8
    1942:	00850713          	addi	a4,a0,8
    1946:	fcce6ee3          	bltu	t3,a2,1922 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    194a:	c215                	beqz	a2,196e <memchr+0xb6>
    194c:	00074783          	lbu	a5,0(a4)
    1950:	00f58d63          	beq	a1,a5,196a <memchr+0xb2>
    1954:	00170793          	addi	a5,a4,1
    1958:	963a                	add	a2,a2,a4
    195a:	873e                	mv	a4,a5
    195c:	00f60963          	beq	a2,a5,196e <memchr+0xb6>
    1960:	0007c683          	lbu	a3,0(a5)
    1964:	0785                	addi	a5,a5,1
    1966:	feb69ae3          	bne	a3,a1,195a <memchr+0xa2>
}
    196a:	853a                	mv	a0,a4
    196c:	8082                	ret
    return n ? (void *)s : 0;
    196e:	4701                	li	a4,0
}
    1970:	853a                	mv	a0,a4
    1972:	8082                	ret
    1974:	872a                	mv	a4,a0
    1976:	00074783          	lbu	a5,0(a4)
    197a:	bfd9                	j	1950 <memchr+0x98>
    197c:	00854783          	lbu	a5,8(a0)
    1980:	bfc1                	j	1950 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1982:	872a                	mv	a4,a0
    1984:	bfc1                	j	1954 <memchr+0x9c>

0000000000001986 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1986:	00757793          	andi	a5,a0,7
    198a:	cfc5                	beqz	a5,1a42 <strnlen+0xbc>
    198c:	c1c5                	beqz	a1,1a2c <strnlen+0xa6>
    198e:	00054783          	lbu	a5,0(a0)
    1992:	cfd9                	beqz	a5,1a30 <strnlen+0xaa>
    1994:	87ae                	mv	a5,a1
    1996:	86aa                	mv	a3,a0
    1998:	a029                	j	19a2 <strnlen+0x1c>
    199a:	cbc9                	beqz	a5,1a2c <strnlen+0xa6>
    199c:	0006c703          	lbu	a4,0(a3)
    19a0:	cb51                	beqz	a4,1a34 <strnlen+0xae>
    19a2:	0685                	addi	a3,a3,1
    19a4:	0076f713          	andi	a4,a3,7
    19a8:	17fd                	addi	a5,a5,-1
    19aa:	fb65                	bnez	a4,199a <strnlen+0x14>
    if (n && *s != c)
    19ac:	c3c1                	beqz	a5,1a2c <strnlen+0xa6>
    19ae:	0006c703          	lbu	a4,0(a3)
    19b2:	c349                	beqz	a4,1a34 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19b4:	471d                	li	a4,7
    19b6:	08f77a63          	bleu	a5,a4,1a4a <strnlen+0xc4>
    19ba:	00000e17          	auipc	t3,0x0
    19be:	6a6e0e13          	addi	t3,t3,1702 # 2060 <__clone+0xb6>
    19c2:	6290                	ld	a2,0(a3)
    19c4:	000e3703          	ld	a4,0(t3)
    19c8:	00000e97          	auipc	t4,0x0
    19cc:	6a0e8e93          	addi	t4,t4,1696 # 2068 <__clone+0xbe>
    19d0:	000eb803          	ld	a6,0(t4)
    19d4:	9732                	add	a4,a4,a2
    19d6:	fff64613          	not	a2,a2
    19da:	8f71                	and	a4,a4,a2
    19dc:	01077733          	and	a4,a4,a6
    19e0:	e72d                	bnez	a4,1a4a <strnlen+0xc4>
    19e2:	4f1d                	li	t5,7
    19e4:	a839                	j	1a02 <strnlen+0x7c>
    19e6:	6698                	ld	a4,8(a3)
    19e8:	000e3303          	ld	t1,0(t3)
    19ec:	000eb803          	ld	a6,0(t4)
    19f0:	fff74893          	not	a7,a4
    19f4:	971a                	add	a4,a4,t1
    19f6:	01177733          	and	a4,a4,a7
    19fa:	01077733          	and	a4,a4,a6
    19fe:	ef1d                	bnez	a4,1a3c <strnlen+0xb6>
    1a00:	86b2                	mv	a3,a2
    1a02:	17e1                	addi	a5,a5,-8
    1a04:	00868613          	addi	a2,a3,8
    1a08:	fcff6fe3          	bltu	t5,a5,19e6 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a0c:	c385                	beqz	a5,1a2c <strnlen+0xa6>
    1a0e:	00064703          	lbu	a4,0(a2)
    1a12:	cb19                	beqz	a4,1a28 <strnlen+0xa2>
    1a14:	00160713          	addi	a4,a2,1
    1a18:	97b2                	add	a5,a5,a2
    1a1a:	863a                	mv	a2,a4
    1a1c:	00e78863          	beq	a5,a4,1a2c <strnlen+0xa6>
    1a20:	0705                	addi	a4,a4,1
    1a22:	fff74683          	lbu	a3,-1(a4)
    1a26:	faf5                	bnez	a3,1a1a <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a28:	40a605b3          	sub	a1,a2,a0
}
    1a2c:	852e                	mv	a0,a1
    1a2e:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a30:	87ae                	mv	a5,a1
    1a32:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a34:	8636                	mv	a2,a3
    1a36:	00064703          	lbu	a4,0(a2)
    1a3a:	bfe1                	j	1a12 <strnlen+0x8c>
    1a3c:	0086c703          	lbu	a4,8(a3)
    1a40:	bfc9                	j	1a12 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a42:	87ae                	mv	a5,a1
    1a44:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a46:	f7a5                	bnez	a5,19ae <strnlen+0x28>
    1a48:	b7d5                	j	1a2c <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a4a:	8636                	mv	a2,a3
    1a4c:	b7e1                	j	1a14 <strnlen+0x8e>

0000000000001a4e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a4e:	00b547b3          	xor	a5,a0,a1
    1a52:	8b9d                	andi	a5,a5,7
    1a54:	efa9                	bnez	a5,1aae <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a56:	0075f793          	andi	a5,a1,7
    1a5a:	c38d                	beqz	a5,1a7c <strcpy+0x2e>
            if (!(*d = *s))
    1a5c:	0005c783          	lbu	a5,0(a1)
    1a60:	00f50023          	sb	a5,0(a0)
    1a64:	e799                	bnez	a5,1a72 <strcpy+0x24>
    1a66:	a095                	j	1aca <strcpy+0x7c>
    1a68:	0005c783          	lbu	a5,0(a1)
    1a6c:	00f50023          	sb	a5,0(a0)
    1a70:	cbb9                	beqz	a5,1ac6 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a72:	0585                	addi	a1,a1,1
    1a74:	0075f793          	andi	a5,a1,7
    1a78:	0505                	addi	a0,a0,1
    1a7a:	f7fd                	bnez	a5,1a68 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a7c:	00000797          	auipc	a5,0x0
    1a80:	5e478793          	addi	a5,a5,1508 # 2060 <__clone+0xb6>
    1a84:	0007b803          	ld	a6,0(a5)
    1a88:	00000797          	auipc	a5,0x0
    1a8c:	5e078793          	addi	a5,a5,1504 # 2068 <__clone+0xbe>
    1a90:	6198                	ld	a4,0(a1)
    1a92:	6390                	ld	a2,0(a5)
    1a94:	a031                	j	1aa0 <strcpy+0x52>
    1a96:	0521                	addi	a0,a0,8
    1a98:	05a1                	addi	a1,a1,8
    1a9a:	fee53c23          	sd	a4,-8(a0)
    1a9e:	6198                	ld	a4,0(a1)
    1aa0:	010707b3          	add	a5,a4,a6
    1aa4:	fff74693          	not	a3,a4
    1aa8:	8ff5                	and	a5,a5,a3
    1aaa:	8ff1                	and	a5,a5,a2
    1aac:	d7ed                	beqz	a5,1a96 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1aae:	0005c783          	lbu	a5,0(a1)
    1ab2:	00f50023          	sb	a5,0(a0)
    1ab6:	cb89                	beqz	a5,1ac8 <strcpy+0x7a>
    1ab8:	0585                	addi	a1,a1,1
    1aba:	0005c783          	lbu	a5,0(a1)
    1abe:	0505                	addi	a0,a0,1
    1ac0:	00f50023          	sb	a5,0(a0)
    1ac4:	fbf5                	bnez	a5,1ab8 <strcpy+0x6a>
        ;
    return d;
}
    1ac6:	8082                	ret
    1ac8:	8082                	ret
    1aca:	8082                	ret

0000000000001acc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1acc:	00b547b3          	xor	a5,a0,a1
    1ad0:	8b9d                	andi	a5,a5,7
    1ad2:	ebc1                	bnez	a5,1b62 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ad4:	0075f793          	andi	a5,a1,7
    1ad8:	cf91                	beqz	a5,1af4 <strncpy+0x28>
    1ada:	20060e63          	beqz	a2,1cf6 <strncpy+0x22a>
    1ade:	0005c783          	lbu	a5,0(a1)
    1ae2:	00f50023          	sb	a5,0(a0)
    1ae6:	c3d5                	beqz	a5,1b8a <strncpy+0xbe>
    1ae8:	0585                	addi	a1,a1,1
    1aea:	0075f793          	andi	a5,a1,7
    1aee:	167d                	addi	a2,a2,-1
    1af0:	0505                	addi	a0,a0,1
    1af2:	f7e5                	bnez	a5,1ada <strncpy+0xe>
            ;
        if (!n || !*s)
    1af4:	20060163          	beqz	a2,1cf6 <strncpy+0x22a>
    1af8:	0005c683          	lbu	a3,0(a1)
    1afc:	c6d9                	beqz	a3,1b8a <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1afe:	479d                	li	a5,7
    1b00:	22c7f563          	bleu	a2,a5,1d2a <strncpy+0x25e>
    1b04:	00000317          	auipc	t1,0x0
    1b08:	55c30313          	addi	t1,t1,1372 # 2060 <__clone+0xb6>
    1b0c:	6198                	ld	a4,0(a1)
    1b0e:	00033783          	ld	a5,0(t1)
    1b12:	00000e17          	auipc	t3,0x0
    1b16:	556e0e13          	addi	t3,t3,1366 # 2068 <__clone+0xbe>
    1b1a:	000e3803          	ld	a6,0(t3)
    1b1e:	97ba                	add	a5,a5,a4
    1b20:	fff74893          	not	a7,a4
    1b24:	0117f7b3          	and	a5,a5,a7
    1b28:	0107f7b3          	and	a5,a5,a6
    1b2c:	1e079f63          	bnez	a5,1d2a <strncpy+0x25e>
    1b30:	4e9d                	li	t4,7
    1b32:	a005                	j	1b52 <strncpy+0x86>
    1b34:	6598                	ld	a4,8(a1)
    1b36:	00033783          	ld	a5,0(t1)
    1b3a:	000e3803          	ld	a6,0(t3)
    1b3e:	fff74893          	not	a7,a4
    1b42:	97ba                	add	a5,a5,a4
    1b44:	0117f7b3          	and	a5,a5,a7
    1b48:	0107f7b3          	and	a5,a5,a6
    1b4c:	1a079f63          	bnez	a5,1d0a <strncpy+0x23e>
    1b50:	85b6                	mv	a1,a3
            *wd = *ws;
    1b52:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b54:	1661                	addi	a2,a2,-8
    1b56:	00858693          	addi	a3,a1,8
    1b5a:	0521                	addi	a0,a0,8
    1b5c:	fcceece3          	bltu	t4,a2,1b34 <strncpy+0x68>
    1b60:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b62:	18060a63          	beqz	a2,1cf6 <strncpy+0x22a>
    1b66:	0005c783          	lbu	a5,0(a1)
    1b6a:	872a                	mv	a4,a0
    1b6c:	00f50023          	sb	a5,0(a0)
    1b70:	e799                	bnez	a5,1b7e <strncpy+0xb2>
    1b72:	a829                	j	1b8c <strncpy+0xc0>
    1b74:	0005c783          	lbu	a5,0(a1)
    1b78:	00f70023          	sb	a5,0(a4)
    1b7c:	cb81                	beqz	a5,1b8c <strncpy+0xc0>
    1b7e:	167d                	addi	a2,a2,-1
    1b80:	0585                	addi	a1,a1,1
    1b82:	0705                	addi	a4,a4,1
    1b84:	fa65                	bnez	a2,1b74 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b86:	853a                	mv	a0,a4
    1b88:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b8a:	872a                	mv	a4,a0
    1b8c:	4805                	li	a6,1
    1b8e:	14061c63          	bnez	a2,1ce6 <strncpy+0x21a>
    1b92:	40e007b3          	neg	a5,a4
    1b96:	8b9d                	andi	a5,a5,7
    1b98:	4581                	li	a1,0
    1b9a:	12061e63          	bnez	a2,1cd6 <strncpy+0x20a>
    1b9e:	00778693          	addi	a3,a5,7
    1ba2:	452d                	li	a0,11
    1ba4:	12a6e763          	bltu	a3,a0,1cd2 <strncpy+0x206>
    1ba8:	16d5e663          	bltu	a1,a3,1d14 <strncpy+0x248>
    1bac:	14078c63          	beqz	a5,1d04 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bb0:	00070023          	sb	zero,0(a4)
    1bb4:	4585                	li	a1,1
    1bb6:	00170693          	addi	a3,a4,1
    1bba:	14b78363          	beq	a5,a1,1d00 <strncpy+0x234>
    1bbe:	000700a3          	sb	zero,1(a4)
    1bc2:	4589                	li	a1,2
    1bc4:	00270693          	addi	a3,a4,2
    1bc8:	14b78963          	beq	a5,a1,1d1a <strncpy+0x24e>
    1bcc:	00070123          	sb	zero,2(a4)
    1bd0:	458d                	li	a1,3
    1bd2:	00370693          	addi	a3,a4,3
    1bd6:	12b78363          	beq	a5,a1,1cfc <strncpy+0x230>
    1bda:	000701a3          	sb	zero,3(a4)
    1bde:	4591                	li	a1,4
    1be0:	00470693          	addi	a3,a4,4
    1be4:	12b78d63          	beq	a5,a1,1d1e <strncpy+0x252>
    1be8:	00070223          	sb	zero,4(a4)
    1bec:	4595                	li	a1,5
    1bee:	00570693          	addi	a3,a4,5
    1bf2:	12b78863          	beq	a5,a1,1d22 <strncpy+0x256>
    1bf6:	000702a3          	sb	zero,5(a4)
    1bfa:	459d                	li	a1,7
    1bfc:	00670693          	addi	a3,a4,6
    1c00:	12b79363          	bne	a5,a1,1d26 <strncpy+0x25a>
    1c04:	00770693          	addi	a3,a4,7
    1c08:	00070323          	sb	zero,6(a4)
    1c0c:	40f80833          	sub	a6,a6,a5
    1c10:	ff887513          	andi	a0,a6,-8
    1c14:	97ba                	add	a5,a5,a4
    1c16:	953e                	add	a0,a0,a5
    1c18:	0007b023          	sd	zero,0(a5)
    1c1c:	07a1                	addi	a5,a5,8
    1c1e:	fea79de3          	bne	a5,a0,1c18 <strncpy+0x14c>
    1c22:	ff887513          	andi	a0,a6,-8
    1c26:	9da9                	addw	a1,a1,a0
    1c28:	00a687b3          	add	a5,a3,a0
    1c2c:	f4a80de3          	beq	a6,a0,1b86 <strncpy+0xba>
    1c30:	00078023          	sb	zero,0(a5)
    1c34:	0015869b          	addiw	a3,a1,1
    1c38:	f4c6f7e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c3c:	000780a3          	sb	zero,1(a5)
    1c40:	0025869b          	addiw	a3,a1,2
    1c44:	f4c6f1e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c48:	00078123          	sb	zero,2(a5)
    1c4c:	0035869b          	addiw	a3,a1,3
    1c50:	f2c6fbe3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c54:	000781a3          	sb	zero,3(a5)
    1c58:	0045869b          	addiw	a3,a1,4
    1c5c:	f2c6f5e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c60:	00078223          	sb	zero,4(a5)
    1c64:	0055869b          	addiw	a3,a1,5
    1c68:	f0c6ffe3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c6c:	000782a3          	sb	zero,5(a5)
    1c70:	0065869b          	addiw	a3,a1,6
    1c74:	f0c6f9e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c78:	00078323          	sb	zero,6(a5)
    1c7c:	0075869b          	addiw	a3,a1,7
    1c80:	f0c6f3e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c84:	000783a3          	sb	zero,7(a5)
    1c88:	0085869b          	addiw	a3,a1,8
    1c8c:	eec6fde3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c90:	00078423          	sb	zero,8(a5)
    1c94:	0095869b          	addiw	a3,a1,9
    1c98:	eec6f7e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1c9c:	000784a3          	sb	zero,9(a5)
    1ca0:	00a5869b          	addiw	a3,a1,10
    1ca4:	eec6f1e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1ca8:	00078523          	sb	zero,10(a5)
    1cac:	00b5869b          	addiw	a3,a1,11
    1cb0:	ecc6fbe3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1cb4:	000785a3          	sb	zero,11(a5)
    1cb8:	00c5869b          	addiw	a3,a1,12
    1cbc:	ecc6f5e3          	bleu	a2,a3,1b86 <strncpy+0xba>
    1cc0:	00078623          	sb	zero,12(a5)
    1cc4:	25b5                	addiw	a1,a1,13
    1cc6:	ecc5f0e3          	bleu	a2,a1,1b86 <strncpy+0xba>
    1cca:	000786a3          	sb	zero,13(a5)
}
    1cce:	853a                	mv	a0,a4
    1cd0:	8082                	ret
    1cd2:	46ad                	li	a3,11
    1cd4:	bdd1                	j	1ba8 <strncpy+0xdc>
    1cd6:	00778693          	addi	a3,a5,7
    1cda:	452d                	li	a0,11
    1cdc:	fff60593          	addi	a1,a2,-1
    1ce0:	eca6f4e3          	bleu	a0,a3,1ba8 <strncpy+0xdc>
    1ce4:	b7fd                	j	1cd2 <strncpy+0x206>
    1ce6:	40e007b3          	neg	a5,a4
    1cea:	8832                	mv	a6,a2
    1cec:	8b9d                	andi	a5,a5,7
    1cee:	4581                	li	a1,0
    1cf0:	ea0607e3          	beqz	a2,1b9e <strncpy+0xd2>
    1cf4:	b7cd                	j	1cd6 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1cf6:	872a                	mv	a4,a0
}
    1cf8:	853a                	mv	a0,a4
    1cfa:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cfc:	458d                	li	a1,3
    1cfe:	b739                	j	1c0c <strncpy+0x140>
    1d00:	4585                	li	a1,1
    1d02:	b729                	j	1c0c <strncpy+0x140>
    1d04:	86ba                	mv	a3,a4
    1d06:	4581                	li	a1,0
    1d08:	b711                	j	1c0c <strncpy+0x140>
    1d0a:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d0e:	872a                	mv	a4,a0
    1d10:	85b6                	mv	a1,a3
    1d12:	bda9                	j	1b6c <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d14:	87ba                	mv	a5,a4
    1d16:	4581                	li	a1,0
    1d18:	bf21                	j	1c30 <strncpy+0x164>
    1d1a:	4589                	li	a1,2
    1d1c:	bdc5                	j	1c0c <strncpy+0x140>
    1d1e:	4591                	li	a1,4
    1d20:	b5f5                	j	1c0c <strncpy+0x140>
    1d22:	4595                	li	a1,5
    1d24:	b5e5                	j	1c0c <strncpy+0x140>
    1d26:	4599                	li	a1,6
    1d28:	b5d5                	j	1c0c <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d2a:	00d50023          	sb	a3,0(a0)
    1d2e:	872a                	mv	a4,a0
    1d30:	b5b9                	j	1b7e <strncpy+0xb2>

0000000000001d32 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d32:	87aa                	mv	a5,a0
    1d34:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d36:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d3a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d3e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d40:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d42:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d46:	2501                	sext.w	a0,a0
    1d48:	8082                	ret

0000000000001d4a <openat>:
    register long a7 __asm__("a7") = n;
    1d4a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d4e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d52:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <close>:
    register long a7 __asm__("a7") = n;
    1d5a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d5e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d62:	2501                	sext.w	a0,a0
    1d64:	8082                	ret

0000000000001d66 <read>:
    register long a7 __asm__("a7") = n;
    1d66:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d6a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d6e:	8082                	ret

0000000000001d70 <write>:
    register long a7 __asm__("a7") = n;
    1d70:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d74:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d78:	8082                	ret

0000000000001d7a <getpid>:
    register long a7 __asm__("a7") = n;
    1d7a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d7e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <getppid>:
    register long a7 __asm__("a7") = n;
    1d86:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d8a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d92:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d96:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d9a:	2501                	sext.w	a0,a0
    1d9c:	8082                	ret

0000000000001d9e <fork>:
    register long a7 __asm__("a7") = n;
    1d9e:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1da2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1da4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1da6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dae:	85b2                	mv	a1,a2
    1db0:	863a                	mv	a2,a4
    if (stack)
    1db2:	c191                	beqz	a1,1db6 <clone+0x8>
	stack += stack_size;
    1db4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1db6:	4781                	li	a5,0
    1db8:	4701                	li	a4,0
    1dba:	4681                	li	a3,0
    1dbc:	2601                	sext.w	a2,a2
    1dbe:	1ec0006f          	j	1faa <__clone>

0000000000001dc2 <exit>:
    register long a7 __asm__("a7") = n;
    1dc2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dc6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dca:	8082                	ret

0000000000001dcc <waitpid>:
    register long a7 __asm__("a7") = n;
    1dcc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dd0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dd2:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dd6:	2501                	sext.w	a0,a0
    1dd8:	8082                	ret

0000000000001dda <exec>:
    register long a7 __asm__("a7") = n;
    1dda:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dde:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1de2:	2501                	sext.w	a0,a0
    1de4:	8082                	ret

0000000000001de6 <execve>:
    register long a7 __asm__("a7") = n;
    1de6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dea:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1dee:	2501                	sext.w	a0,a0
    1df0:	8082                	ret

0000000000001df2 <times>:
    register long a7 __asm__("a7") = n;
    1df2:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1df6:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	8082                	ret

0000000000001dfe <get_time>:

int64 get_time()
{
    1dfe:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e00:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e04:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e06:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e08:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e0c:	2501                	sext.w	a0,a0
    1e0e:	ed09                	bnez	a0,1e28 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e10:	67a2                	ld	a5,8(sp)
    1e12:	3e800713          	li	a4,1000
    1e16:	00015503          	lhu	a0,0(sp)
    1e1a:	02e7d7b3          	divu	a5,a5,a4
    1e1e:	02e50533          	mul	a0,a0,a4
    1e22:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e24:	0141                	addi	sp,sp,16
    1e26:	8082                	ret
        return -1;
    1e28:	557d                	li	a0,-1
    1e2a:	bfed                	j	1e24 <get_time+0x26>

0000000000001e2c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e2c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e30:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e34:	2501                	sext.w	a0,a0
    1e36:	8082                	ret

0000000000001e38 <time>:
    register long a7 __asm__("a7") = n;
    1e38:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e3c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e40:	2501                	sext.w	a0,a0
    1e42:	8082                	ret

0000000000001e44 <sleep>:

int sleep(unsigned long long time)
{
    1e44:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e46:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e48:	850a                	mv	a0,sp
    1e4a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e4c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e50:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e52:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e56:	e501                	bnez	a0,1e5e <sleep+0x1a>
    return 0;
    1e58:	4501                	li	a0,0
}
    1e5a:	0141                	addi	sp,sp,16
    1e5c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e5e:	4502                	lw	a0,0(sp)
}
    1e60:	0141                	addi	sp,sp,16
    1e62:	8082                	ret

0000000000001e64 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e64:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e68:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e6c:	2501                	sext.w	a0,a0
    1e6e:	8082                	ret

0000000000001e70 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e70:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e74:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e78:	8082                	ret

0000000000001e7a <munmap>:
    register long a7 __asm__("a7") = n;
    1e7a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e7e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e82:	2501                	sext.w	a0,a0
    1e84:	8082                	ret

0000000000001e86 <wait>:

int wait(int *code)
{
    1e86:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e88:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e8c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e8e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e90:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e92:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <spawn>:
    register long a7 __asm__("a7") = n;
    1e9a:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e9e:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ea2:	2501                	sext.w	a0,a0
    1ea4:	8082                	ret

0000000000001ea6 <mailread>:
    register long a7 __asm__("a7") = n;
    1ea6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eaa:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1eae:	2501                	sext.w	a0,a0
    1eb0:	8082                	ret

0000000000001eb2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1eb2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eb6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eba:	2501                	sext.w	a0,a0
    1ebc:	8082                	ret

0000000000001ebe <fstat>:
    register long a7 __asm__("a7") = n;
    1ebe:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ec6:	2501                	sext.w	a0,a0
    1ec8:	8082                	ret

0000000000001eca <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1eca:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ecc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ed0:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ed2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eda:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1edc:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ee0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ee2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <link>:

int link(char *old_path, char *new_path)
{
    1eea:	87aa                	mv	a5,a0
    1eec:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1eee:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ef2:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ef6:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ef8:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1efc:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1efe:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f02:	2501                	sext.w	a0,a0
    1f04:	8082                	ret

0000000000001f06 <unlink>:

int unlink(char *path)
{
    1f06:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f08:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f0c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f10:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f12:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f16:	2501                	sext.w	a0,a0
    1f18:	8082                	ret

0000000000001f1a <uname>:
    register long a7 __asm__("a7") = n;
    1f1a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f1e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f22:	2501                	sext.w	a0,a0
    1f24:	8082                	ret

0000000000001f26 <brk>:
    register long a7 __asm__("a7") = n;
    1f26:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f2a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f2e:	2501                	sext.w	a0,a0
    1f30:	8082                	ret

0000000000001f32 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f32:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f34:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f38:	8082                	ret

0000000000001f3a <chdir>:
    register long a7 __asm__("a7") = n;
    1f3a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f3e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f42:	2501                	sext.w	a0,a0
    1f44:	8082                	ret

0000000000001f46 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f46:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f48:	02059613          	slli	a2,a1,0x20
    1f4c:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f4e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f52:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f56:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f58:	00000073          	ecall
}
    1f5c:	2501                	sext.w	a0,a0
    1f5e:	8082                	ret

0000000000001f60 <getdents>:
    register long a7 __asm__("a7") = n;
    1f60:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f64:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <pipe>:
    register long a7 __asm__("a7") = n;
    1f6c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f70:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f72:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f76:	2501                	sext.w	a0,a0
    1f78:	8082                	ret

0000000000001f7a <dup>:
    register long a7 __asm__("a7") = n;
    1f7a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f7c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f80:	2501                	sext.w	a0,a0
    1f82:	8082                	ret

0000000000001f84 <dup2>:
    register long a7 __asm__("a7") = n;
    1f84:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f86:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f88:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f8c:	2501                	sext.w	a0,a0
    1f8e:	8082                	ret

0000000000001f90 <mount>:
    register long a7 __asm__("a7") = n;
    1f90:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f94:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f98:	2501                	sext.w	a0,a0
    1f9a:	8082                	ret

0000000000001f9c <umount>:
    register long a7 __asm__("a7") = n;
    1f9c:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fa0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fa2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1faa:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fac:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fae:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fb0:	8532                	mv	a0,a2
	mv a2, a4
    1fb2:	863a                	mv	a2,a4
	mv a3, a5
    1fb4:	86be                	mv	a3,a5
	mv a4, a6
    1fb6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fb8:	0dc00893          	li	a7,220
	ecall
    1fbc:	00000073          	ecall

	beqz a0, 1f
    1fc0:	c111                	beqz	a0,1fc4 <__clone+0x1a>
	# Parent
	ret
    1fc2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fc4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fc6:	6522                	ld	a0,8(sp)
	jalr a1
    1fc8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fca:	05d00893          	li	a7,93
	ecall
    1fce:	00000073          	ecall
