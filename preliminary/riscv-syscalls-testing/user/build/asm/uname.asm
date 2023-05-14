
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/uname:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0be0006f          	j	10c0 <__start_main>

0000000000001006 <test_uname>:
	char domainname[65];
};

struct utsname un;

void test_uname() {
    1006:	1141                	addi	sp,sp,-16
	TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	ff050513          	addi	a0,a0,-16 # 1ff8 <__clone+0x28>
void test_uname() {
    1010:	e406                	sd	ra,8(sp)
	TEST_START(__func__);
    1012:	2ae000ef          	jal	ra,12c0 <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	20250513          	addi	a0,a0,514 # 2218 <__func__.1219>
    101e:	2a2000ef          	jal	ra,12c0 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fee50513          	addi	a0,a0,-18 # 2010 <__clone+0x40>
    102a:	296000ef          	jal	ra,12c0 <puts>
	int test_ret = uname(&un);
    102e:	00001517          	auipc	a0,0x1
    1032:	06250513          	addi	a0,a0,98 # 2090 <un>
    1036:	70b000ef          	jal	ra,1f40 <uname>
	assert(test_ret >= 0);
    103a:	06054463          	bltz	a0,10a2 <test_uname+0x9c>

	printf("Uname: %s %s %s %s %s %s\n", 
    103e:	00001817          	auipc	a6,0x1
    1042:	19780813          	addi	a6,a6,407 # 21d5 <un+0x145>
    1046:	00001797          	auipc	a5,0x1
    104a:	14e78793          	addi	a5,a5,334 # 2194 <un+0x104>
    104e:	00001717          	auipc	a4,0x1
    1052:	10570713          	addi	a4,a4,261 # 2153 <un+0xc3>
    1056:	00001697          	auipc	a3,0x1
    105a:	0bc68693          	addi	a3,a3,188 # 2112 <un+0x82>
    105e:	00001617          	auipc	a2,0x1
    1062:	07360613          	addi	a2,a2,115 # 20d1 <un+0x41>
    1066:	00001597          	auipc	a1,0x1
    106a:	02a58593          	addi	a1,a1,42 # 2090 <un>
    106e:	00001517          	auipc	a0,0x1
    1072:	fd250513          	addi	a0,a0,-46 # 2040 <__clone+0x70>
    1076:	26c000ef          	jal	ra,12e2 <printf>
		un.sysname, un.nodename, un.release, un.version, un.machine, un.domainname);

	TEST_END(__func__);
    107a:	00001517          	auipc	a0,0x1
    107e:	fe650513          	addi	a0,a0,-26 # 2060 <__clone+0x90>
    1082:	23e000ef          	jal	ra,12c0 <puts>
    1086:	00001517          	auipc	a0,0x1
    108a:	19250513          	addi	a0,a0,402 # 2218 <__func__.1219>
    108e:	232000ef          	jal	ra,12c0 <puts>
}
    1092:	60a2                	ld	ra,8(sp)
	TEST_END(__func__);
    1094:	00001517          	auipc	a0,0x1
    1098:	f7c50513          	addi	a0,a0,-132 # 2010 <__clone+0x40>
}
    109c:	0141                	addi	sp,sp,16
	TEST_END(__func__);
    109e:	2220006f          	j	12c0 <puts>
	assert(test_ret >= 0);
    10a2:	00001517          	auipc	a0,0x1
    10a6:	f7e50513          	addi	a0,a0,-130 # 2020 <__clone+0x50>
    10aa:	4dc000ef          	jal	ra,1586 <panic>
    10ae:	bf41                	j	103e <test_uname+0x38>

00000000000010b0 <main>:

int main(void) {
    10b0:	1141                	addi	sp,sp,-16
    10b2:	e406                	sd	ra,8(sp)
	test_uname();
    10b4:	f53ff0ef          	jal	ra,1006 <test_uname>
	return 0;
}
    10b8:	60a2                	ld	ra,8(sp)
    10ba:	4501                	li	a0,0
    10bc:	0141                	addi	sp,sp,16
    10be:	8082                	ret

00000000000010c0 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10c0:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10c2:	4108                	lw	a0,0(a0)
{
    10c4:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10c6:	05a1                	addi	a1,a1,8
{
    10c8:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10ca:	fe7ff0ef          	jal	ra,10b0 <main>
    10ce:	51b000ef          	jal	ra,1de8 <exit>
	return 0;
}
    10d2:	60a2                	ld	ra,8(sp)
    10d4:	4501                	li	a0,0
    10d6:	0141                	addi	sp,sp,16
    10d8:	8082                	ret

00000000000010da <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10da:	7179                	addi	sp,sp,-48
    10dc:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10de:	12054e63          	bltz	a0,121a <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10e2:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10e6:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10e8:	02b7f6bb          	remuw	a3,a5,a1
    10ec:	00001717          	auipc	a4,0x1
    10f0:	13c70713          	addi	a4,a4,316 # 2228 <digits>
    buf[16] = 0;
    10f4:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10f8:	1682                	slli	a3,a3,0x20
    10fa:	9281                	srli	a3,a3,0x20
    10fc:	96ba                	add	a3,a3,a4
    10fe:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1102:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1106:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    110a:	16b7e363          	bltu	a5,a1,1270 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    110e:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1112:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1116:	1602                	slli	a2,a2,0x20
    1118:	9201                	srli	a2,a2,0x20
    111a:	963a                	add	a2,a2,a4
    111c:	00064603          	lbu	a2,0(a2)
    1120:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1124:	0007861b          	sext.w	a2,a5
    1128:	12b6e863          	bltu	a3,a1,1258 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    112c:	02b7f6bb          	remuw	a3,a5,a1
    1130:	1682                	slli	a3,a3,0x20
    1132:	9281                	srli	a3,a3,0x20
    1134:	96ba                	add	a3,a3,a4
    1136:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113a:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    113e:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    1142:	10b66e63          	bltu	a2,a1,125e <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1146:	02b876bb          	remuw	a3,a6,a1
    114a:	1682                	slli	a3,a3,0x20
    114c:	9281                	srli	a3,a3,0x20
    114e:	96ba                	add	a3,a3,a4
    1150:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1154:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1158:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    115c:	10b86463          	bltu	a6,a1,1264 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    1160:	02b676bb          	remuw	a3,a2,a1
    1164:	1682                	slli	a3,a3,0x20
    1166:	9281                	srli	a3,a3,0x20
    1168:	96ba                	add	a3,a3,a4
    116a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    116e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1172:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1176:	0eb66a63          	bltu	a2,a1,126a <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    117a:	02b876bb          	remuw	a3,a6,a1
    117e:	1682                	slli	a3,a3,0x20
    1180:	9281                	srli	a3,a3,0x20
    1182:	96ba                	add	a3,a3,a4
    1184:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1188:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    118c:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1190:	0cb86163          	bltu	a6,a1,1252 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1194:	02b676bb          	remuw	a3,a2,a1
    1198:	1682                	slli	a3,a3,0x20
    119a:	9281                	srli	a3,a3,0x20
    119c:	96ba                	add	a3,a3,a4
    119e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a2:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    11a6:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    11aa:	0cb66563          	bltu	a2,a1,1274 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    11ae:	02b876bb          	remuw	a3,a6,a1
    11b2:	1682                	slli	a3,a3,0x20
    11b4:	9281                	srli	a3,a3,0x20
    11b6:	96ba                	add	a3,a3,a4
    11b8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11bc:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11c0:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11c4:	0ab86b63          	bltu	a6,a1,127a <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11c8:	02b676bb          	remuw	a3,a2,a1
    11cc:	1682                	slli	a3,a3,0x20
    11ce:	9281                	srli	a3,a3,0x20
    11d0:	96ba                	add	a3,a3,a4
    11d2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11d6:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11da:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11de:	0ab66163          	bltu	a2,a1,1280 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11e2:	1782                	slli	a5,a5,0x20
    11e4:	9381                	srli	a5,a5,0x20
    11e6:	97ba                	add	a5,a5,a4
    11e8:	0007c703          	lbu	a4,0(a5)
    11ec:	4599                	li	a1,6
    11ee:	4795                	li	a5,5
    11f0:	00e10723          	sb	a4,14(sp)

    if (sign)
    11f4:	00055963          	bgez	a0,1206 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11f8:	1018                	addi	a4,sp,32
    11fa:	973e                	add	a4,a4,a5
    11fc:	02d00693          	li	a3,45
    1200:	fed70423          	sb	a3,-24(a4)
    1204:	85be                	mv	a1,a5
    write(f, s, l);
    1206:	003c                	addi	a5,sp,8
    1208:	4641                	li	a2,16
    120a:	9e0d                	subw	a2,a2,a1
    120c:	4505                	li	a0,1
    120e:	95be                	add	a1,a1,a5
    1210:	387000ef          	jal	ra,1d96 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1214:	70a2                	ld	ra,40(sp)
    1216:	6145                	addi	sp,sp,48
    1218:	8082                	ret
        x = -xx;
    121a:	40a0063b          	negw	a2,a0
    121e:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    1220:	02b677bb          	remuw	a5,a2,a1
    1224:	00001717          	auipc	a4,0x1
    1228:	00470713          	addi	a4,a4,4 # 2228 <digits>
    buf[16] = 0;
    122c:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    1230:	1782                	slli	a5,a5,0x20
    1232:	9381                	srli	a5,a5,0x20
    1234:	97ba                	add	a5,a5,a4
    1236:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    123a:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    123e:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    1242:	ecb676e3          	bleu	a1,a2,110e <printint.constprop.0+0x34>
        buf[i--] = '-';
    1246:	02d00793          	li	a5,45
    124a:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    124e:	45b9                	li	a1,14
    1250:	bf5d                	j	1206 <printint.constprop.0+0x12c>
    1252:	47a5                	li	a5,9
    1254:	45a9                	li	a1,10
    1256:	bf79                	j	11f4 <printint.constprop.0+0x11a>
    1258:	47b5                	li	a5,13
    125a:	45b9                	li	a1,14
    125c:	bf61                	j	11f4 <printint.constprop.0+0x11a>
    125e:	47b1                	li	a5,12
    1260:	45b5                	li	a1,13
    1262:	bf49                	j	11f4 <printint.constprop.0+0x11a>
    1264:	47ad                	li	a5,11
    1266:	45b1                	li	a1,12
    1268:	b771                	j	11f4 <printint.constprop.0+0x11a>
    126a:	47a9                	li	a5,10
    126c:	45ad                	li	a1,11
    126e:	b759                	j	11f4 <printint.constprop.0+0x11a>
    i = 15;
    1270:	45bd                	li	a1,15
    1272:	bf51                	j	1206 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1274:	47a1                	li	a5,8
    1276:	45a5                	li	a1,9
    1278:	bfb5                	j	11f4 <printint.constprop.0+0x11a>
    127a:	479d                	li	a5,7
    127c:	45a1                	li	a1,8
    127e:	bf9d                	j	11f4 <printint.constprop.0+0x11a>
    1280:	4799                	li	a5,6
    1282:	459d                	li	a1,7
    1284:	bf85                	j	11f4 <printint.constprop.0+0x11a>

0000000000001286 <getchar>:
{
    1286:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1288:	00f10593          	addi	a1,sp,15
    128c:	4605                	li	a2,1
    128e:	4501                	li	a0,0
{
    1290:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1292:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1296:	2f7000ef          	jal	ra,1d8c <read>
}
    129a:	60e2                	ld	ra,24(sp)
    129c:	00f14503          	lbu	a0,15(sp)
    12a0:	6105                	addi	sp,sp,32
    12a2:	8082                	ret

00000000000012a4 <putchar>:
{
    12a4:	1101                	addi	sp,sp,-32
    char byte = c;
    12a6:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    12aa:	00f10593          	addi	a1,sp,15
    12ae:	4605                	li	a2,1
    12b0:	4505                	li	a0,1
{
    12b2:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    12b4:	2e3000ef          	jal	ra,1d96 <write>
}
    12b8:	60e2                	ld	ra,24(sp)
    12ba:	2501                	sext.w	a0,a0
    12bc:	6105                	addi	sp,sp,32
    12be:	8082                	ret

00000000000012c0 <puts>:
{
    12c0:	1141                	addi	sp,sp,-16
    12c2:	e406                	sd	ra,8(sp)
    12c4:	e022                	sd	s0,0(sp)
    12c6:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12c8:	5b2000ef          	jal	ra,187a <strlen>
    12cc:	862a                	mv	a2,a0
    12ce:	85a2                	mv	a1,s0
    12d0:	4505                	li	a0,1
    12d2:	2c5000ef          	jal	ra,1d96 <write>
}
    12d6:	60a2                	ld	ra,8(sp)
    12d8:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12da:	957d                	srai	a0,a0,0x3f
    return r;
    12dc:	2501                	sext.w	a0,a0
}
    12de:	0141                	addi	sp,sp,16
    12e0:	8082                	ret

00000000000012e2 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12e2:	7131                	addi	sp,sp,-192
    12e4:	e0da                	sd	s6,64(sp)
    12e6:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12e8:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12ea:	013c                	addi	a5,sp,136
{
    12ec:	f0ca                	sd	s2,96(sp)
    12ee:	ecce                	sd	s3,88(sp)
    12f0:	e8d2                	sd	s4,80(sp)
    12f2:	e4d6                	sd	s5,72(sp)
    12f4:	fc5e                	sd	s7,56(sp)
    12f6:	fc86                	sd	ra,120(sp)
    12f8:	f8a2                	sd	s0,112(sp)
    12fa:	f4a6                	sd	s1,104(sp)
    12fc:	89aa                	mv	s3,a0
    12fe:	e52e                	sd	a1,136(sp)
    1300:	e932                	sd	a2,144(sp)
    1302:	ed36                	sd	a3,152(sp)
    1304:	f13a                	sd	a4,160(sp)
    1306:	f942                	sd	a6,176(sp)
    1308:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    130a:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    130c:	02500913          	li	s2,37
    1310:	07000a93          	li	s5,112
    buf[i++] = '0';
    1314:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1318:	00001a17          	auipc	s4,0x1
    131c:	f10a0a13          	addi	s4,s4,-240 # 2228 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    1320:	00001b97          	auipc	s7,0x1
    1324:	d50b8b93          	addi	s7,s7,-688 # 2070 <__clone+0xa0>
        if (!*s)
    1328:	0009c783          	lbu	a5,0(s3)
    132c:	cfb9                	beqz	a5,138a <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    132e:	23278d63          	beq	a5,s2,1568 <printf+0x286>
    1332:	864e                	mv	a2,s3
    1334:	a019                	j	133a <printf+0x58>
    1336:	07278563          	beq	a5,s2,13a0 <printf+0xbe>
    133a:	0605                	addi	a2,a2,1
    133c:	00064783          	lbu	a5,0(a2)
    1340:	fbfd                	bnez	a5,1336 <printf+0x54>
    1342:	84b2                	mv	s1,a2
        l = z - a;
    1344:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1348:	8622                	mv	a2,s0
    134a:	85ce                	mv	a1,s3
    134c:	4505                	li	a0,1
    134e:	249000ef          	jal	ra,1d96 <write>
        if (l)
    1352:	ec3d                	bnez	s0,13d0 <printf+0xee>
        if (s[1] == 0)
    1354:	0014c783          	lbu	a5,1(s1)
    1358:	cb8d                	beqz	a5,138a <printf+0xa8>
        switch (s[1])
    135a:	09578b63          	beq	a5,s5,13f0 <printf+0x10e>
    135e:	06fafb63          	bleu	a5,s5,13d4 <printf+0xf2>
    1362:	07300713          	li	a4,115
    1366:	1ce78e63          	beq	a5,a4,1542 <printf+0x260>
    136a:	07800713          	li	a4,120
    136e:	1ae79563          	bne	a5,a4,1518 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    1372:	6782                	ld	a5,0(sp)
    1374:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1376:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    137a:	4388                	lw	a0,0(a5)
    137c:	07a1                	addi	a5,a5,8
    137e:	e03e                	sd	a5,0(sp)
    1380:	d5bff0ef          	jal	ra,10da <printint.constprop.0>
        if (!*s)
    1384:	0009c783          	lbu	a5,0(s3)
    1388:	f3dd                	bnez	a5,132e <printf+0x4c>
    }
    va_end(ap);
}
    138a:	70e6                	ld	ra,120(sp)
    138c:	7446                	ld	s0,112(sp)
    138e:	74a6                	ld	s1,104(sp)
    1390:	7906                	ld	s2,96(sp)
    1392:	69e6                	ld	s3,88(sp)
    1394:	6a46                	ld	s4,80(sp)
    1396:	6aa6                	ld	s5,72(sp)
    1398:	6b06                	ld	s6,64(sp)
    139a:	7be2                	ld	s7,56(sp)
    139c:	6129                	addi	sp,sp,192
    139e:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    13a0:	00164783          	lbu	a5,1(a2)
    13a4:	84b2                	mv	s1,a2
    13a6:	01278763          	beq	a5,s2,13b4 <printf+0xd2>
    13aa:	bf69                	j	1344 <printf+0x62>
    13ac:	0014c783          	lbu	a5,1(s1)
    13b0:	f9279ae3          	bne	a5,s2,1344 <printf+0x62>
    13b4:	0489                	addi	s1,s1,2
    13b6:	0004c783          	lbu	a5,0(s1)
    13ba:	0605                	addi	a2,a2,1
    13bc:	ff2788e3          	beq	a5,s2,13ac <printf+0xca>
        l = z - a;
    13c0:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13c4:	8622                	mv	a2,s0
    13c6:	85ce                	mv	a1,s3
    13c8:	4505                	li	a0,1
    13ca:	1cd000ef          	jal	ra,1d96 <write>
        if (l)
    13ce:	d059                	beqz	s0,1354 <printf+0x72>
    13d0:	89a6                	mv	s3,s1
    13d2:	bf99                	j	1328 <printf+0x46>
    13d4:	06400713          	li	a4,100
    13d8:	14e79063          	bne	a5,a4,1518 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13dc:	6782                	ld	a5,0(sp)
    13de:	45a9                	li	a1,10
        s += 2;
    13e0:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13e4:	4388                	lw	a0,0(a5)
    13e6:	07a1                	addi	a5,a5,8
    13e8:	e03e                	sd	a5,0(sp)
    13ea:	cf1ff0ef          	jal	ra,10da <printint.constprop.0>
        s += 2;
    13ee:	bf59                	j	1384 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13f0:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13f2:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13f6:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13f8:	631c                	ld	a5,0(a4)
    13fa:	0721                	addi	a4,a4,8
    13fc:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13fe:	00479293          	slli	t0,a5,0x4
    1402:	00879f93          	slli	t6,a5,0x8
    1406:	00c79f13          	slli	t5,a5,0xc
    140a:	01079e93          	slli	t4,a5,0x10
    140e:	01479e13          	slli	t3,a5,0x14
    1412:	01879313          	slli	t1,a5,0x18
    1416:	01c79893          	slli	a7,a5,0x1c
    141a:	02479813          	slli	a6,a5,0x24
    141e:	02879513          	slli	a0,a5,0x28
    1422:	02c79593          	slli	a1,a5,0x2c
    1426:	03079693          	slli	a3,a5,0x30
    142a:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    142e:	03c7d413          	srli	s0,a5,0x3c
    1432:	01c7d39b          	srliw	t2,a5,0x1c
    1436:	03c2d293          	srli	t0,t0,0x3c
    143a:	03cfdf93          	srli	t6,t6,0x3c
    143e:	03cf5f13          	srli	t5,t5,0x3c
    1442:	03cede93          	srli	t4,t4,0x3c
    1446:	03ce5e13          	srli	t3,t3,0x3c
    144a:	03c35313          	srli	t1,t1,0x3c
    144e:	03c8d893          	srli	a7,a7,0x3c
    1452:	03c85813          	srli	a6,a6,0x3c
    1456:	9171                	srli	a0,a0,0x3c
    1458:	91f1                	srli	a1,a1,0x3c
    145a:	92f1                	srli	a3,a3,0x3c
    145c:	9371                	srli	a4,a4,0x3c
    145e:	96d2                	add	a3,a3,s4
    1460:	9752                	add	a4,a4,s4
    1462:	9452                	add	s0,s0,s4
    1464:	92d2                	add	t0,t0,s4
    1466:	9fd2                	add	t6,t6,s4
    1468:	9f52                	add	t5,t5,s4
    146a:	9ed2                	add	t4,t4,s4
    146c:	9e52                	add	t3,t3,s4
    146e:	9352                	add	t1,t1,s4
    1470:	98d2                	add	a7,a7,s4
    1472:	93d2                	add	t2,t2,s4
    1474:	9852                	add	a6,a6,s4
    1476:	9552                	add	a0,a0,s4
    1478:	95d2                	add	a1,a1,s4
    147a:	0006c983          	lbu	s3,0(a3)
    147e:	0002c283          	lbu	t0,0(t0)
    1482:	00074683          	lbu	a3,0(a4)
    1486:	000fcf83          	lbu	t6,0(t6)
    148a:	000f4f03          	lbu	t5,0(t5)
    148e:	000ece83          	lbu	t4,0(t4)
    1492:	000e4e03          	lbu	t3,0(t3)
    1496:	00034303          	lbu	t1,0(t1)
    149a:	0008c883          	lbu	a7,0(a7)
    149e:	0003c383          	lbu	t2,0(t2)
    14a2:	00084803          	lbu	a6,0(a6)
    14a6:	00054503          	lbu	a0,0(a0)
    14aa:	0005c583          	lbu	a1,0(a1)
    14ae:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    14b2:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14b6:	9371                	srli	a4,a4,0x3c
    14b8:	8bbd                	andi	a5,a5,15
    14ba:	9752                	add	a4,a4,s4
    14bc:	97d2                	add	a5,a5,s4
    14be:	005105a3          	sb	t0,11(sp)
    14c2:	01f10623          	sb	t6,12(sp)
    14c6:	01e106a3          	sb	t5,13(sp)
    14ca:	01d10723          	sb	t4,14(sp)
    14ce:	01c107a3          	sb	t3,15(sp)
    14d2:	00610823          	sb	t1,16(sp)
    14d6:	011108a3          	sb	a7,17(sp)
    14da:	00710923          	sb	t2,18(sp)
    14de:	010109a3          	sb	a6,19(sp)
    14e2:	00a10a23          	sb	a0,20(sp)
    14e6:	00b10aa3          	sb	a1,21(sp)
    14ea:	01310b23          	sb	s3,22(sp)
    14ee:	00d10ba3          	sb	a3,23(sp)
    14f2:	00810523          	sb	s0,10(sp)
    14f6:	00074703          	lbu	a4,0(a4)
    14fa:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14fe:	002c                	addi	a1,sp,8
    1500:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1502:	00e10c23          	sb	a4,24(sp)
    1506:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    150a:	00010d23          	sb	zero,26(sp)
        s += 2;
    150e:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1512:	085000ef          	jal	ra,1d96 <write>
        s += 2;
    1516:	b5bd                	j	1384 <printf+0xa2>
    char byte = c;
    1518:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    151c:	4605                	li	a2,1
    151e:	002c                	addi	a1,sp,8
    1520:	4505                	li	a0,1
    char byte = c;
    1522:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1526:	071000ef          	jal	ra,1d96 <write>
    char byte = c;
    152a:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    152e:	4605                	li	a2,1
    1530:	002c                	addi	a1,sp,8
    1532:	4505                	li	a0,1
    char byte = c;
    1534:	00f10423          	sb	a5,8(sp)
        s += 2;
    1538:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    153c:	05b000ef          	jal	ra,1d96 <write>
        s += 2;
    1540:	b591                	j	1384 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    1542:	6782                	ld	a5,0(sp)
    1544:	6380                	ld	s0,0(a5)
    1546:	07a1                	addi	a5,a5,8
    1548:	e03e                	sd	a5,0(sp)
    154a:	cc05                	beqz	s0,1582 <printf+0x2a0>
            l = strnlen(a, 200);
    154c:	0c800593          	li	a1,200
    1550:	8522                	mv	a0,s0
    1552:	45a000ef          	jal	ra,19ac <strnlen>
    write(f, s, l);
    1556:	0005061b          	sext.w	a2,a0
    155a:	85a2                	mv	a1,s0
    155c:	4505                	li	a0,1
    155e:	039000ef          	jal	ra,1d96 <write>
        s += 2;
    1562:	00248993          	addi	s3,s1,2
    1566:	bd39                	j	1384 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1568:	0019c783          	lbu	a5,1(s3)
    156c:	84ce                	mv	s1,s3
    156e:	864e                	mv	a2,s3
    1570:	e52782e3          	beq	a5,s2,13b4 <printf+0xd2>
    write(f, s, l);
    1574:	4601                	li	a2,0
    1576:	85ce                	mv	a1,s3
    1578:	4505                	li	a0,1
    157a:	01d000ef          	jal	ra,1d96 <write>
    157e:	84ce                	mv	s1,s3
    1580:	bbd1                	j	1354 <printf+0x72>
                a = "(null)";
    1582:	845e                	mv	s0,s7
    1584:	b7e1                	j	154c <printf+0x26a>

0000000000001586 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1586:	1141                	addi	sp,sp,-16
    1588:	e406                	sd	ra,8(sp)
    puts(m);
    158a:	d37ff0ef          	jal	ra,12c0 <puts>
    exit(-100);
}
    158e:	60a2                	ld	ra,8(sp)
    exit(-100);
    1590:	f9c00513          	li	a0,-100
}
    1594:	0141                	addi	sp,sp,16
    exit(-100);
    1596:	0530006f          	j	1de8 <exit>

000000000000159a <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    159a:	02000793          	li	a5,32
    159e:	00f50663          	beq	a0,a5,15aa <isspace+0x10>
    15a2:	355d                	addiw	a0,a0,-9
    15a4:	00553513          	sltiu	a0,a0,5
    15a8:	8082                	ret
    15aa:	4505                	li	a0,1
}
    15ac:	8082                	ret

00000000000015ae <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    15ae:	fd05051b          	addiw	a0,a0,-48
}
    15b2:	00a53513          	sltiu	a0,a0,10
    15b6:	8082                	ret

00000000000015b8 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15b8:	02000613          	li	a2,32
    15bc:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15be:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15c2:	0007079b          	sext.w	a5,a4
    15c6:	ff77869b          	addiw	a3,a5,-9
    15ca:	04c70b63          	beq	a4,a2,1620 <atoi+0x68>
    15ce:	04d5f963          	bleu	a3,a1,1620 <atoi+0x68>
        s++;
    switch (*s)
    15d2:	02b00693          	li	a3,43
    15d6:	04d70a63          	beq	a4,a3,162a <atoi+0x72>
    15da:	02d00693          	li	a3,45
    15de:	06d70463          	beq	a4,a3,1646 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15e2:	fd07859b          	addiw	a1,a5,-48
    15e6:	4625                	li	a2,9
    15e8:	873e                	mv	a4,a5
    15ea:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15ec:	4e01                	li	t3,0
    while (isdigit(*s))
    15ee:	04b66a63          	bltu	a2,a1,1642 <atoi+0x8a>
    int n = 0, neg = 0;
    15f2:	4501                	li	a0,0
    while (isdigit(*s))
    15f4:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15f6:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15f8:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15fc:	0025179b          	slliw	a5,a0,0x2
    1600:	9d3d                	addw	a0,a0,a5
    1602:	fd07031b          	addiw	t1,a4,-48
    1606:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    160a:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    160e:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1612:	0006071b          	sext.w	a4,a2
    1616:	feb870e3          	bleu	a1,a6,15f6 <atoi+0x3e>
    return neg ? n : -n;
    161a:	000e0563          	beqz	t3,1624 <atoi+0x6c>
}
    161e:	8082                	ret
        s++;
    1620:	0505                	addi	a0,a0,1
    1622:	bf71                	j	15be <atoi+0x6>
    1624:	4113053b          	subw	a0,t1,a7
    1628:	8082                	ret
    while (isdigit(*s))
    162a:	00154783          	lbu	a5,1(a0)
    162e:	4625                	li	a2,9
        s++;
    1630:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1634:	fd07859b          	addiw	a1,a5,-48
    1638:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    163c:	4e01                	li	t3,0
    while (isdigit(*s))
    163e:	fab67ae3          	bleu	a1,a2,15f2 <atoi+0x3a>
    1642:	4501                	li	a0,0
}
    1644:	8082                	ret
    while (isdigit(*s))
    1646:	00154783          	lbu	a5,1(a0)
    164a:	4625                	li	a2,9
        s++;
    164c:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1650:	fd07859b          	addiw	a1,a5,-48
    1654:	0007871b          	sext.w	a4,a5
    1658:	feb665e3          	bltu	a2,a1,1642 <atoi+0x8a>
        neg = 1;
    165c:	4e05                	li	t3,1
    165e:	bf51                	j	15f2 <atoi+0x3a>

0000000000001660 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1660:	16060d63          	beqz	a2,17da <memset+0x17a>
    1664:	40a007b3          	neg	a5,a0
    1668:	8b9d                	andi	a5,a5,7
    166a:	00778713          	addi	a4,a5,7
    166e:	482d                	li	a6,11
    1670:	0ff5f593          	andi	a1,a1,255
    1674:	fff60693          	addi	a3,a2,-1
    1678:	17076263          	bltu	a4,a6,17dc <memset+0x17c>
    167c:	16e6ea63          	bltu	a3,a4,17f0 <memset+0x190>
    1680:	16078563          	beqz	a5,17ea <memset+0x18a>
    1684:	00b50023          	sb	a1,0(a0)
    1688:	4705                	li	a4,1
    168a:	00150e93          	addi	t4,a0,1
    168e:	14e78c63          	beq	a5,a4,17e6 <memset+0x186>
    1692:	00b500a3          	sb	a1,1(a0)
    1696:	4709                	li	a4,2
    1698:	00250e93          	addi	t4,a0,2
    169c:	14e78d63          	beq	a5,a4,17f6 <memset+0x196>
    16a0:	00b50123          	sb	a1,2(a0)
    16a4:	470d                	li	a4,3
    16a6:	00350e93          	addi	t4,a0,3
    16aa:	12e78b63          	beq	a5,a4,17e0 <memset+0x180>
    16ae:	00b501a3          	sb	a1,3(a0)
    16b2:	4711                	li	a4,4
    16b4:	00450e93          	addi	t4,a0,4
    16b8:	14e78163          	beq	a5,a4,17fa <memset+0x19a>
    16bc:	00b50223          	sb	a1,4(a0)
    16c0:	4715                	li	a4,5
    16c2:	00550e93          	addi	t4,a0,5
    16c6:	12e78c63          	beq	a5,a4,17fe <memset+0x19e>
    16ca:	00b502a3          	sb	a1,5(a0)
    16ce:	471d                	li	a4,7
    16d0:	00650e93          	addi	t4,a0,6
    16d4:	12e79763          	bne	a5,a4,1802 <memset+0x1a2>
    16d8:	00750e93          	addi	t4,a0,7
    16dc:	00b50323          	sb	a1,6(a0)
    16e0:	4f1d                	li	t5,7
    16e2:	00859713          	slli	a4,a1,0x8
    16e6:	8f4d                	or	a4,a4,a1
    16e8:	01059e13          	slli	t3,a1,0x10
    16ec:	01c76e33          	or	t3,a4,t3
    16f0:	01859313          	slli	t1,a1,0x18
    16f4:	006e6333          	or	t1,t3,t1
    16f8:	02059893          	slli	a7,a1,0x20
    16fc:	011368b3          	or	a7,t1,a7
    1700:	02859813          	slli	a6,a1,0x28
    1704:	40f60333          	sub	t1,a2,a5
    1708:	0108e833          	or	a6,a7,a6
    170c:	03059693          	slli	a3,a1,0x30
    1710:	00d866b3          	or	a3,a6,a3
    1714:	03859713          	slli	a4,a1,0x38
    1718:	97aa                	add	a5,a5,a0
    171a:	ff837813          	andi	a6,t1,-8
    171e:	8f55                	or	a4,a4,a3
    1720:	00f806b3          	add	a3,a6,a5
    1724:	e398                	sd	a4,0(a5)
    1726:	07a1                	addi	a5,a5,8
    1728:	fed79ee3          	bne	a5,a3,1724 <memset+0xc4>
    172c:	ff837693          	andi	a3,t1,-8
    1730:	00de87b3          	add	a5,t4,a3
    1734:	01e6873b          	addw	a4,a3,t5
    1738:	0ad30663          	beq	t1,a3,17e4 <memset+0x184>
    173c:	00b78023          	sb	a1,0(a5)
    1740:	0017069b          	addiw	a3,a4,1
    1744:	08c6fb63          	bleu	a2,a3,17da <memset+0x17a>
    1748:	00b780a3          	sb	a1,1(a5)
    174c:	0027069b          	addiw	a3,a4,2
    1750:	08c6f563          	bleu	a2,a3,17da <memset+0x17a>
    1754:	00b78123          	sb	a1,2(a5)
    1758:	0037069b          	addiw	a3,a4,3
    175c:	06c6ff63          	bleu	a2,a3,17da <memset+0x17a>
    1760:	00b781a3          	sb	a1,3(a5)
    1764:	0047069b          	addiw	a3,a4,4
    1768:	06c6f963          	bleu	a2,a3,17da <memset+0x17a>
    176c:	00b78223          	sb	a1,4(a5)
    1770:	0057069b          	addiw	a3,a4,5
    1774:	06c6f363          	bleu	a2,a3,17da <memset+0x17a>
    1778:	00b782a3          	sb	a1,5(a5)
    177c:	0067069b          	addiw	a3,a4,6
    1780:	04c6fd63          	bleu	a2,a3,17da <memset+0x17a>
    1784:	00b78323          	sb	a1,6(a5)
    1788:	0077069b          	addiw	a3,a4,7
    178c:	04c6f763          	bleu	a2,a3,17da <memset+0x17a>
    1790:	00b783a3          	sb	a1,7(a5)
    1794:	0087069b          	addiw	a3,a4,8
    1798:	04c6f163          	bleu	a2,a3,17da <memset+0x17a>
    179c:	00b78423          	sb	a1,8(a5)
    17a0:	0097069b          	addiw	a3,a4,9
    17a4:	02c6fb63          	bleu	a2,a3,17da <memset+0x17a>
    17a8:	00b784a3          	sb	a1,9(a5)
    17ac:	00a7069b          	addiw	a3,a4,10
    17b0:	02c6f563          	bleu	a2,a3,17da <memset+0x17a>
    17b4:	00b78523          	sb	a1,10(a5)
    17b8:	00b7069b          	addiw	a3,a4,11
    17bc:	00c6ff63          	bleu	a2,a3,17da <memset+0x17a>
    17c0:	00b785a3          	sb	a1,11(a5)
    17c4:	00c7069b          	addiw	a3,a4,12
    17c8:	00c6f963          	bleu	a2,a3,17da <memset+0x17a>
    17cc:	00b78623          	sb	a1,12(a5)
    17d0:	2735                	addiw	a4,a4,13
    17d2:	00c77463          	bleu	a2,a4,17da <memset+0x17a>
    17d6:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17da:	8082                	ret
    17dc:	472d                	li	a4,11
    17de:	bd79                	j	167c <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17e0:	4f0d                	li	t5,3
    17e2:	b701                	j	16e2 <memset+0x82>
    17e4:	8082                	ret
    17e6:	4f05                	li	t5,1
    17e8:	bded                	j	16e2 <memset+0x82>
    17ea:	8eaa                	mv	t4,a0
    17ec:	4f01                	li	t5,0
    17ee:	bdd5                	j	16e2 <memset+0x82>
    17f0:	87aa                	mv	a5,a0
    17f2:	4701                	li	a4,0
    17f4:	b7a1                	j	173c <memset+0xdc>
    17f6:	4f09                	li	t5,2
    17f8:	b5ed                	j	16e2 <memset+0x82>
    17fa:	4f11                	li	t5,4
    17fc:	b5dd                	j	16e2 <memset+0x82>
    17fe:	4f15                	li	t5,5
    1800:	b5cd                	j	16e2 <memset+0x82>
    1802:	4f19                	li	t5,6
    1804:	bdf9                	j	16e2 <memset+0x82>

0000000000001806 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1806:	00054703          	lbu	a4,0(a0)
    180a:	0005c783          	lbu	a5,0(a1)
    180e:	00e79b63          	bne	a5,a4,1824 <strcmp+0x1e>
    1812:	cf89                	beqz	a5,182c <strcmp+0x26>
    1814:	0505                	addi	a0,a0,1
    1816:	0585                	addi	a1,a1,1
    1818:	0005c783          	lbu	a5,0(a1)
    181c:	00054703          	lbu	a4,0(a0)
    1820:	fef709e3          	beq	a4,a5,1812 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1824:	0007051b          	sext.w	a0,a4
}
    1828:	9d1d                	subw	a0,a0,a5
    182a:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    182c:	4501                	li	a0,0
}
    182e:	9d1d                	subw	a0,a0,a5
    1830:	8082                	ret

0000000000001832 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    1832:	c231                	beqz	a2,1876 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1834:	00054783          	lbu	a5,0(a0)
    1838:	0005c683          	lbu	a3,0(a1)
    183c:	c795                	beqz	a5,1868 <strncmp+0x36>
    183e:	ca85                	beqz	a3,186e <strncmp+0x3c>
    if (!n--)
    1840:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    1842:	c615                	beqz	a2,186e <strncmp+0x3c>
    1844:	00150713          	addi	a4,a0,1
    1848:	9532                	add	a0,a0,a2
    184a:	00d78963          	beq	a5,a3,185c <strncmp+0x2a>
    184e:	a005                	j	186e <strncmp+0x3c>
    1850:	ce99                	beqz	a3,186e <strncmp+0x3c>
    1852:	00e50e63          	beq	a0,a4,186e <strncmp+0x3c>
    1856:	0705                	addi	a4,a4,1
    1858:	00d79b63          	bne	a5,a3,186e <strncmp+0x3c>
    185c:	00074783          	lbu	a5,0(a4)
    1860:	0585                	addi	a1,a1,1
    1862:	0005c683          	lbu	a3,0(a1)
    1866:	f7ed                	bnez	a5,1850 <strncmp+0x1e>
    1868:	4501                	li	a0,0
        ;
    return *l - *r;
    186a:	9d15                	subw	a0,a0,a3
    186c:	8082                	ret
    186e:	0007851b          	sext.w	a0,a5
    1872:	9d15                	subw	a0,a0,a3
    1874:	8082                	ret
        return 0;
    1876:	4501                	li	a0,0
}
    1878:	8082                	ret

000000000000187a <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    187a:	00757793          	andi	a5,a0,7
    187e:	cfa1                	beqz	a5,18d6 <strlen+0x5c>
        if (!*s)
    1880:	00054783          	lbu	a5,0(a0)
    1884:	cbb9                	beqz	a5,18da <strlen+0x60>
    1886:	87aa                	mv	a5,a0
    1888:	a021                	j	1890 <strlen+0x16>
    188a:	0007c703          	lbu	a4,0(a5)
    188e:	c329                	beqz	a4,18d0 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1890:	0785                	addi	a5,a5,1
    1892:	0077f713          	andi	a4,a5,7
    1896:	fb75                	bnez	a4,188a <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1898:	00000717          	auipc	a4,0x0
    189c:	7e070713          	addi	a4,a4,2016 # 2078 <__clone+0xa8>
    18a0:	630c                	ld	a1,0(a4)
    18a2:	00000717          	auipc	a4,0x0
    18a6:	7de70713          	addi	a4,a4,2014 # 2080 <__clone+0xb0>
    18aa:	6394                	ld	a3,0(a5)
    18ac:	6310                	ld	a2,0(a4)
    18ae:	a019                	j	18b4 <strlen+0x3a>
    18b0:	07a1                	addi	a5,a5,8
    18b2:	6394                	ld	a3,0(a5)
    18b4:	00b68733          	add	a4,a3,a1
    18b8:	fff6c693          	not	a3,a3
    18bc:	8f75                	and	a4,a4,a3
    18be:	8f71                	and	a4,a4,a2
    18c0:	db65                	beqz	a4,18b0 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18c2:	0007c703          	lbu	a4,0(a5)
    18c6:	c709                	beqz	a4,18d0 <strlen+0x56>
    18c8:	0785                	addi	a5,a5,1
    18ca:	0007c703          	lbu	a4,0(a5)
    18ce:	ff6d                	bnez	a4,18c8 <strlen+0x4e>
        ;
    return s - a;
    18d0:	40a78533          	sub	a0,a5,a0
}
    18d4:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18d6:	87aa                	mv	a5,a0
    18d8:	b7c1                	j	1898 <strlen+0x1e>
        if (!*s)
    18da:	4501                	li	a0,0
            return s - a;
    18dc:	8082                	ret

00000000000018de <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18de:	00757793          	andi	a5,a0,7
    18e2:	0ff5f593          	andi	a1,a1,255
    18e6:	cb99                	beqz	a5,18fc <memchr+0x1e>
    18e8:	c655                	beqz	a2,1994 <memchr+0xb6>
    18ea:	00054783          	lbu	a5,0(a0)
    18ee:	0ab78663          	beq	a5,a1,199a <memchr+0xbc>
    18f2:	0505                	addi	a0,a0,1
    18f4:	00757793          	andi	a5,a0,7
    18f8:	167d                	addi	a2,a2,-1
    18fa:	f7fd                	bnez	a5,18e8 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18fc:	4701                	li	a4,0
    if (n && *s != c)
    18fe:	ca49                	beqz	a2,1990 <memchr+0xb2>
    1900:	00054783          	lbu	a5,0(a0)
    1904:	08b78b63          	beq	a5,a1,199a <memchr+0xbc>
        size_t k = ONES * c;
    1908:	00000797          	auipc	a5,0x0
    190c:	78078793          	addi	a5,a5,1920 # 2088 <__clone+0xb8>
    1910:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1912:	479d                	li	a5,7
        size_t k = ONES * c;
    1914:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1918:	08c7f863          	bleu	a2,a5,19a8 <memchr+0xca>
    191c:	611c                	ld	a5,0(a0)
    191e:	00000317          	auipc	t1,0x0
    1922:	76230313          	addi	t1,t1,1890 # 2080 <__clone+0xb0>
    1926:	00033803          	ld	a6,0(t1)
    192a:	00f8c7b3          	xor	a5,a7,a5
    192e:	fff7c713          	not	a4,a5
    1932:	8f95                	sub	a5,a5,a3
    1934:	8ff9                	and	a5,a5,a4
    1936:	0107f7b3          	and	a5,a5,a6
    193a:	e7bd                	bnez	a5,19a8 <memchr+0xca>
    193c:	4e1d                	li	t3,7
    193e:	00000e97          	auipc	t4,0x0
    1942:	73ae8e93          	addi	t4,t4,1850 # 2078 <__clone+0xa8>
    1946:	a005                	j	1966 <memchr+0x88>
    1948:	6514                	ld	a3,8(a0)
    194a:	000eb783          	ld	a5,0(t4)
    194e:	00033803          	ld	a6,0(t1)
    1952:	00d8c6b3          	xor	a3,a7,a3
    1956:	97b6                	add	a5,a5,a3
    1958:	fff6c693          	not	a3,a3
    195c:	8ff5                	and	a5,a5,a3
    195e:	0107f7b3          	and	a5,a5,a6
    1962:	e3a1                	bnez	a5,19a2 <memchr+0xc4>
    1964:	853a                	mv	a0,a4
    1966:	1661                	addi	a2,a2,-8
    1968:	00850713          	addi	a4,a0,8
    196c:	fcce6ee3          	bltu	t3,a2,1948 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1970:	c215                	beqz	a2,1994 <memchr+0xb6>
    1972:	00074783          	lbu	a5,0(a4)
    1976:	00f58d63          	beq	a1,a5,1990 <memchr+0xb2>
    197a:	00170793          	addi	a5,a4,1
    197e:	963a                	add	a2,a2,a4
    1980:	873e                	mv	a4,a5
    1982:	00f60963          	beq	a2,a5,1994 <memchr+0xb6>
    1986:	0007c683          	lbu	a3,0(a5)
    198a:	0785                	addi	a5,a5,1
    198c:	feb69ae3          	bne	a3,a1,1980 <memchr+0xa2>
}
    1990:	853a                	mv	a0,a4
    1992:	8082                	ret
    return n ? (void *)s : 0;
    1994:	4701                	li	a4,0
}
    1996:	853a                	mv	a0,a4
    1998:	8082                	ret
    199a:	872a                	mv	a4,a0
    199c:	00074783          	lbu	a5,0(a4)
    19a0:	bfd9                	j	1976 <memchr+0x98>
    19a2:	00854783          	lbu	a5,8(a0)
    19a6:	bfc1                	j	1976 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a8:	872a                	mv	a4,a0
    19aa:	bfc1                	j	197a <memchr+0x9c>

00000000000019ac <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19ac:	00757793          	andi	a5,a0,7
    19b0:	cfc5                	beqz	a5,1a68 <strnlen+0xbc>
    19b2:	c1c5                	beqz	a1,1a52 <strnlen+0xa6>
    19b4:	00054783          	lbu	a5,0(a0)
    19b8:	cfd9                	beqz	a5,1a56 <strnlen+0xaa>
    19ba:	87ae                	mv	a5,a1
    19bc:	86aa                	mv	a3,a0
    19be:	a029                	j	19c8 <strnlen+0x1c>
    19c0:	cbc9                	beqz	a5,1a52 <strnlen+0xa6>
    19c2:	0006c703          	lbu	a4,0(a3)
    19c6:	cb51                	beqz	a4,1a5a <strnlen+0xae>
    19c8:	0685                	addi	a3,a3,1
    19ca:	0076f713          	andi	a4,a3,7
    19ce:	17fd                	addi	a5,a5,-1
    19d0:	fb65                	bnez	a4,19c0 <strnlen+0x14>
    if (n && *s != c)
    19d2:	c3c1                	beqz	a5,1a52 <strnlen+0xa6>
    19d4:	0006c703          	lbu	a4,0(a3)
    19d8:	c349                	beqz	a4,1a5a <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19da:	471d                	li	a4,7
    19dc:	08f77a63          	bleu	a5,a4,1a70 <strnlen+0xc4>
    19e0:	00000e17          	auipc	t3,0x0
    19e4:	698e0e13          	addi	t3,t3,1688 # 2078 <__clone+0xa8>
    19e8:	6290                	ld	a2,0(a3)
    19ea:	000e3703          	ld	a4,0(t3)
    19ee:	00000e97          	auipc	t4,0x0
    19f2:	692e8e93          	addi	t4,t4,1682 # 2080 <__clone+0xb0>
    19f6:	000eb803          	ld	a6,0(t4)
    19fa:	9732                	add	a4,a4,a2
    19fc:	fff64613          	not	a2,a2
    1a00:	8f71                	and	a4,a4,a2
    1a02:	01077733          	and	a4,a4,a6
    1a06:	e72d                	bnez	a4,1a70 <strnlen+0xc4>
    1a08:	4f1d                	li	t5,7
    1a0a:	a839                	j	1a28 <strnlen+0x7c>
    1a0c:	6698                	ld	a4,8(a3)
    1a0e:	000e3303          	ld	t1,0(t3)
    1a12:	000eb803          	ld	a6,0(t4)
    1a16:	fff74893          	not	a7,a4
    1a1a:	971a                	add	a4,a4,t1
    1a1c:	01177733          	and	a4,a4,a7
    1a20:	01077733          	and	a4,a4,a6
    1a24:	ef1d                	bnez	a4,1a62 <strnlen+0xb6>
    1a26:	86b2                	mv	a3,a2
    1a28:	17e1                	addi	a5,a5,-8
    1a2a:	00868613          	addi	a2,a3,8
    1a2e:	fcff6fe3          	bltu	t5,a5,1a0c <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a32:	c385                	beqz	a5,1a52 <strnlen+0xa6>
    1a34:	00064703          	lbu	a4,0(a2)
    1a38:	cb19                	beqz	a4,1a4e <strnlen+0xa2>
    1a3a:	00160713          	addi	a4,a2,1
    1a3e:	97b2                	add	a5,a5,a2
    1a40:	863a                	mv	a2,a4
    1a42:	00e78863          	beq	a5,a4,1a52 <strnlen+0xa6>
    1a46:	0705                	addi	a4,a4,1
    1a48:	fff74683          	lbu	a3,-1(a4)
    1a4c:	faf5                	bnez	a3,1a40 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a4e:	40a605b3          	sub	a1,a2,a0
}
    1a52:	852e                	mv	a0,a1
    1a54:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a56:	87ae                	mv	a5,a1
    1a58:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a5a:	8636                	mv	a2,a3
    1a5c:	00064703          	lbu	a4,0(a2)
    1a60:	bfe1                	j	1a38 <strnlen+0x8c>
    1a62:	0086c703          	lbu	a4,8(a3)
    1a66:	bfc9                	j	1a38 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a68:	87ae                	mv	a5,a1
    1a6a:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a6c:	f7a5                	bnez	a5,19d4 <strnlen+0x28>
    1a6e:	b7d5                	j	1a52 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a70:	8636                	mv	a2,a3
    1a72:	b7e1                	j	1a3a <strnlen+0x8e>

0000000000001a74 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a74:	00b547b3          	xor	a5,a0,a1
    1a78:	8b9d                	andi	a5,a5,7
    1a7a:	efa9                	bnez	a5,1ad4 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a7c:	0075f793          	andi	a5,a1,7
    1a80:	c38d                	beqz	a5,1aa2 <strcpy+0x2e>
            if (!(*d = *s))
    1a82:	0005c783          	lbu	a5,0(a1)
    1a86:	00f50023          	sb	a5,0(a0)
    1a8a:	e799                	bnez	a5,1a98 <strcpy+0x24>
    1a8c:	a095                	j	1af0 <strcpy+0x7c>
    1a8e:	0005c783          	lbu	a5,0(a1)
    1a92:	00f50023          	sb	a5,0(a0)
    1a96:	cbb9                	beqz	a5,1aec <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a98:	0585                	addi	a1,a1,1
    1a9a:	0075f793          	andi	a5,a1,7
    1a9e:	0505                	addi	a0,a0,1
    1aa0:	f7fd                	bnez	a5,1a8e <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1aa2:	00000797          	auipc	a5,0x0
    1aa6:	5d678793          	addi	a5,a5,1494 # 2078 <__clone+0xa8>
    1aaa:	0007b803          	ld	a6,0(a5)
    1aae:	00000797          	auipc	a5,0x0
    1ab2:	5d278793          	addi	a5,a5,1490 # 2080 <__clone+0xb0>
    1ab6:	6198                	ld	a4,0(a1)
    1ab8:	6390                	ld	a2,0(a5)
    1aba:	a031                	j	1ac6 <strcpy+0x52>
    1abc:	0521                	addi	a0,a0,8
    1abe:	05a1                	addi	a1,a1,8
    1ac0:	fee53c23          	sd	a4,-8(a0)
    1ac4:	6198                	ld	a4,0(a1)
    1ac6:	010707b3          	add	a5,a4,a6
    1aca:	fff74693          	not	a3,a4
    1ace:	8ff5                	and	a5,a5,a3
    1ad0:	8ff1                	and	a5,a5,a2
    1ad2:	d7ed                	beqz	a5,1abc <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1ad4:	0005c783          	lbu	a5,0(a1)
    1ad8:	00f50023          	sb	a5,0(a0)
    1adc:	cb89                	beqz	a5,1aee <strcpy+0x7a>
    1ade:	0585                	addi	a1,a1,1
    1ae0:	0005c783          	lbu	a5,0(a1)
    1ae4:	0505                	addi	a0,a0,1
    1ae6:	00f50023          	sb	a5,0(a0)
    1aea:	fbf5                	bnez	a5,1ade <strcpy+0x6a>
        ;
    return d;
}
    1aec:	8082                	ret
    1aee:	8082                	ret
    1af0:	8082                	ret

0000000000001af2 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1af2:	00b547b3          	xor	a5,a0,a1
    1af6:	8b9d                	andi	a5,a5,7
    1af8:	ebc1                	bnez	a5,1b88 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1afa:	0075f793          	andi	a5,a1,7
    1afe:	cf91                	beqz	a5,1b1a <strncpy+0x28>
    1b00:	20060e63          	beqz	a2,1d1c <strncpy+0x22a>
    1b04:	0005c783          	lbu	a5,0(a1)
    1b08:	00f50023          	sb	a5,0(a0)
    1b0c:	c3d5                	beqz	a5,1bb0 <strncpy+0xbe>
    1b0e:	0585                	addi	a1,a1,1
    1b10:	0075f793          	andi	a5,a1,7
    1b14:	167d                	addi	a2,a2,-1
    1b16:	0505                	addi	a0,a0,1
    1b18:	f7e5                	bnez	a5,1b00 <strncpy+0xe>
            ;
        if (!n || !*s)
    1b1a:	20060163          	beqz	a2,1d1c <strncpy+0x22a>
    1b1e:	0005c683          	lbu	a3,0(a1)
    1b22:	c6d9                	beqz	a3,1bb0 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b24:	479d                	li	a5,7
    1b26:	22c7f563          	bleu	a2,a5,1d50 <strncpy+0x25e>
    1b2a:	00000317          	auipc	t1,0x0
    1b2e:	54e30313          	addi	t1,t1,1358 # 2078 <__clone+0xa8>
    1b32:	6198                	ld	a4,0(a1)
    1b34:	00033783          	ld	a5,0(t1)
    1b38:	00000e17          	auipc	t3,0x0
    1b3c:	548e0e13          	addi	t3,t3,1352 # 2080 <__clone+0xb0>
    1b40:	000e3803          	ld	a6,0(t3)
    1b44:	97ba                	add	a5,a5,a4
    1b46:	fff74893          	not	a7,a4
    1b4a:	0117f7b3          	and	a5,a5,a7
    1b4e:	0107f7b3          	and	a5,a5,a6
    1b52:	1e079f63          	bnez	a5,1d50 <strncpy+0x25e>
    1b56:	4e9d                	li	t4,7
    1b58:	a005                	j	1b78 <strncpy+0x86>
    1b5a:	6598                	ld	a4,8(a1)
    1b5c:	00033783          	ld	a5,0(t1)
    1b60:	000e3803          	ld	a6,0(t3)
    1b64:	fff74893          	not	a7,a4
    1b68:	97ba                	add	a5,a5,a4
    1b6a:	0117f7b3          	and	a5,a5,a7
    1b6e:	0107f7b3          	and	a5,a5,a6
    1b72:	1a079f63          	bnez	a5,1d30 <strncpy+0x23e>
    1b76:	85b6                	mv	a1,a3
            *wd = *ws;
    1b78:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b7a:	1661                	addi	a2,a2,-8
    1b7c:	00858693          	addi	a3,a1,8
    1b80:	0521                	addi	a0,a0,8
    1b82:	fcceece3          	bltu	t4,a2,1b5a <strncpy+0x68>
    1b86:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b88:	18060a63          	beqz	a2,1d1c <strncpy+0x22a>
    1b8c:	0005c783          	lbu	a5,0(a1)
    1b90:	872a                	mv	a4,a0
    1b92:	00f50023          	sb	a5,0(a0)
    1b96:	e799                	bnez	a5,1ba4 <strncpy+0xb2>
    1b98:	a829                	j	1bb2 <strncpy+0xc0>
    1b9a:	0005c783          	lbu	a5,0(a1)
    1b9e:	00f70023          	sb	a5,0(a4)
    1ba2:	cb81                	beqz	a5,1bb2 <strncpy+0xc0>
    1ba4:	167d                	addi	a2,a2,-1
    1ba6:	0585                	addi	a1,a1,1
    1ba8:	0705                	addi	a4,a4,1
    1baa:	fa65                	bnez	a2,1b9a <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1bac:	853a                	mv	a0,a4
    1bae:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1bb0:	872a                	mv	a4,a0
    1bb2:	4805                	li	a6,1
    1bb4:	14061c63          	bnez	a2,1d0c <strncpy+0x21a>
    1bb8:	40e007b3          	neg	a5,a4
    1bbc:	8b9d                	andi	a5,a5,7
    1bbe:	4581                	li	a1,0
    1bc0:	12061e63          	bnez	a2,1cfc <strncpy+0x20a>
    1bc4:	00778693          	addi	a3,a5,7
    1bc8:	452d                	li	a0,11
    1bca:	12a6e763          	bltu	a3,a0,1cf8 <strncpy+0x206>
    1bce:	16d5e663          	bltu	a1,a3,1d3a <strncpy+0x248>
    1bd2:	14078c63          	beqz	a5,1d2a <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bd6:	00070023          	sb	zero,0(a4)
    1bda:	4585                	li	a1,1
    1bdc:	00170693          	addi	a3,a4,1
    1be0:	14b78363          	beq	a5,a1,1d26 <strncpy+0x234>
    1be4:	000700a3          	sb	zero,1(a4)
    1be8:	4589                	li	a1,2
    1bea:	00270693          	addi	a3,a4,2
    1bee:	14b78963          	beq	a5,a1,1d40 <strncpy+0x24e>
    1bf2:	00070123          	sb	zero,2(a4)
    1bf6:	458d                	li	a1,3
    1bf8:	00370693          	addi	a3,a4,3
    1bfc:	12b78363          	beq	a5,a1,1d22 <strncpy+0x230>
    1c00:	000701a3          	sb	zero,3(a4)
    1c04:	4591                	li	a1,4
    1c06:	00470693          	addi	a3,a4,4
    1c0a:	12b78d63          	beq	a5,a1,1d44 <strncpy+0x252>
    1c0e:	00070223          	sb	zero,4(a4)
    1c12:	4595                	li	a1,5
    1c14:	00570693          	addi	a3,a4,5
    1c18:	12b78863          	beq	a5,a1,1d48 <strncpy+0x256>
    1c1c:	000702a3          	sb	zero,5(a4)
    1c20:	459d                	li	a1,7
    1c22:	00670693          	addi	a3,a4,6
    1c26:	12b79363          	bne	a5,a1,1d4c <strncpy+0x25a>
    1c2a:	00770693          	addi	a3,a4,7
    1c2e:	00070323          	sb	zero,6(a4)
    1c32:	40f80833          	sub	a6,a6,a5
    1c36:	ff887513          	andi	a0,a6,-8
    1c3a:	97ba                	add	a5,a5,a4
    1c3c:	953e                	add	a0,a0,a5
    1c3e:	0007b023          	sd	zero,0(a5)
    1c42:	07a1                	addi	a5,a5,8
    1c44:	fea79de3          	bne	a5,a0,1c3e <strncpy+0x14c>
    1c48:	ff887513          	andi	a0,a6,-8
    1c4c:	9da9                	addw	a1,a1,a0
    1c4e:	00a687b3          	add	a5,a3,a0
    1c52:	f4a80de3          	beq	a6,a0,1bac <strncpy+0xba>
    1c56:	00078023          	sb	zero,0(a5)
    1c5a:	0015869b          	addiw	a3,a1,1
    1c5e:	f4c6f7e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1c62:	000780a3          	sb	zero,1(a5)
    1c66:	0025869b          	addiw	a3,a1,2
    1c6a:	f4c6f1e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1c6e:	00078123          	sb	zero,2(a5)
    1c72:	0035869b          	addiw	a3,a1,3
    1c76:	f2c6fbe3          	bleu	a2,a3,1bac <strncpy+0xba>
    1c7a:	000781a3          	sb	zero,3(a5)
    1c7e:	0045869b          	addiw	a3,a1,4
    1c82:	f2c6f5e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1c86:	00078223          	sb	zero,4(a5)
    1c8a:	0055869b          	addiw	a3,a1,5
    1c8e:	f0c6ffe3          	bleu	a2,a3,1bac <strncpy+0xba>
    1c92:	000782a3          	sb	zero,5(a5)
    1c96:	0065869b          	addiw	a3,a1,6
    1c9a:	f0c6f9e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1c9e:	00078323          	sb	zero,6(a5)
    1ca2:	0075869b          	addiw	a3,a1,7
    1ca6:	f0c6f3e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1caa:	000783a3          	sb	zero,7(a5)
    1cae:	0085869b          	addiw	a3,a1,8
    1cb2:	eec6fde3          	bleu	a2,a3,1bac <strncpy+0xba>
    1cb6:	00078423          	sb	zero,8(a5)
    1cba:	0095869b          	addiw	a3,a1,9
    1cbe:	eec6f7e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1cc2:	000784a3          	sb	zero,9(a5)
    1cc6:	00a5869b          	addiw	a3,a1,10
    1cca:	eec6f1e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1cce:	00078523          	sb	zero,10(a5)
    1cd2:	00b5869b          	addiw	a3,a1,11
    1cd6:	ecc6fbe3          	bleu	a2,a3,1bac <strncpy+0xba>
    1cda:	000785a3          	sb	zero,11(a5)
    1cde:	00c5869b          	addiw	a3,a1,12
    1ce2:	ecc6f5e3          	bleu	a2,a3,1bac <strncpy+0xba>
    1ce6:	00078623          	sb	zero,12(a5)
    1cea:	25b5                	addiw	a1,a1,13
    1cec:	ecc5f0e3          	bleu	a2,a1,1bac <strncpy+0xba>
    1cf0:	000786a3          	sb	zero,13(a5)
}
    1cf4:	853a                	mv	a0,a4
    1cf6:	8082                	ret
    1cf8:	46ad                	li	a3,11
    1cfa:	bdd1                	j	1bce <strncpy+0xdc>
    1cfc:	00778693          	addi	a3,a5,7
    1d00:	452d                	li	a0,11
    1d02:	fff60593          	addi	a1,a2,-1
    1d06:	eca6f4e3          	bleu	a0,a3,1bce <strncpy+0xdc>
    1d0a:	b7fd                	j	1cf8 <strncpy+0x206>
    1d0c:	40e007b3          	neg	a5,a4
    1d10:	8832                	mv	a6,a2
    1d12:	8b9d                	andi	a5,a5,7
    1d14:	4581                	li	a1,0
    1d16:	ea0607e3          	beqz	a2,1bc4 <strncpy+0xd2>
    1d1a:	b7cd                	j	1cfc <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d1c:	872a                	mv	a4,a0
}
    1d1e:	853a                	mv	a0,a4
    1d20:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d22:	458d                	li	a1,3
    1d24:	b739                	j	1c32 <strncpy+0x140>
    1d26:	4585                	li	a1,1
    1d28:	b729                	j	1c32 <strncpy+0x140>
    1d2a:	86ba                	mv	a3,a4
    1d2c:	4581                	li	a1,0
    1d2e:	b711                	j	1c32 <strncpy+0x140>
    1d30:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d34:	872a                	mv	a4,a0
    1d36:	85b6                	mv	a1,a3
    1d38:	bda9                	j	1b92 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d3a:	87ba                	mv	a5,a4
    1d3c:	4581                	li	a1,0
    1d3e:	bf21                	j	1c56 <strncpy+0x164>
    1d40:	4589                	li	a1,2
    1d42:	bdc5                	j	1c32 <strncpy+0x140>
    1d44:	4591                	li	a1,4
    1d46:	b5f5                	j	1c32 <strncpy+0x140>
    1d48:	4595                	li	a1,5
    1d4a:	b5e5                	j	1c32 <strncpy+0x140>
    1d4c:	4599                	li	a1,6
    1d4e:	b5d5                	j	1c32 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d50:	00d50023          	sb	a3,0(a0)
    1d54:	872a                	mv	a4,a0
    1d56:	b5b9                	j	1ba4 <strncpy+0xb2>

0000000000001d58 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d58:	87aa                	mv	a5,a0
    1d5a:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d5c:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d60:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d64:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d66:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d68:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d6c:	2501                	sext.w	a0,a0
    1d6e:	8082                	ret

0000000000001d70 <openat>:
    register long a7 __asm__("a7") = n;
    1d70:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d74:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d78:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <close>:
    register long a7 __asm__("a7") = n;
    1d80:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d84:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <read>:
    register long a7 __asm__("a7") = n;
    1d8c:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d90:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d94:	8082                	ret

0000000000001d96 <write>:
    register long a7 __asm__("a7") = n;
    1d96:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d9a:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d9e:	8082                	ret

0000000000001da0 <getpid>:
    register long a7 __asm__("a7") = n;
    1da0:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1da4:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1da8:	2501                	sext.w	a0,a0
    1daa:	8082                	ret

0000000000001dac <getppid>:
    register long a7 __asm__("a7") = n;
    1dac:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1db0:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1db4:	2501                	sext.w	a0,a0
    1db6:	8082                	ret

0000000000001db8 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1db8:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1dbc:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1dc0:	2501                	sext.w	a0,a0
    1dc2:	8082                	ret

0000000000001dc4 <fork>:
    register long a7 __asm__("a7") = n;
    1dc4:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1dc8:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1dca:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dcc:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dd4:	85b2                	mv	a1,a2
    1dd6:	863a                	mv	a2,a4
    if (stack)
    1dd8:	c191                	beqz	a1,1ddc <clone+0x8>
	stack += stack_size;
    1dda:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1ddc:	4781                	li	a5,0
    1dde:	4701                	li	a4,0
    1de0:	4681                	li	a3,0
    1de2:	2601                	sext.w	a2,a2
    1de4:	1ec0006f          	j	1fd0 <__clone>

0000000000001de8 <exit>:
    register long a7 __asm__("a7") = n;
    1de8:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dec:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1df0:	8082                	ret

0000000000001df2 <waitpid>:
    register long a7 __asm__("a7") = n;
    1df2:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1df6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1df8:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dfc:	2501                	sext.w	a0,a0
    1dfe:	8082                	ret

0000000000001e00 <exec>:
    register long a7 __asm__("a7") = n;
    1e00:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1e04:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1e08:	2501                	sext.w	a0,a0
    1e0a:	8082                	ret

0000000000001e0c <execve>:
    register long a7 __asm__("a7") = n;
    1e0c:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e10:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1e14:	2501                	sext.w	a0,a0
    1e16:	8082                	ret

0000000000001e18 <times>:
    register long a7 __asm__("a7") = n;
    1e18:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e1c:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e20:	2501                	sext.w	a0,a0
    1e22:	8082                	ret

0000000000001e24 <get_time>:

int64 get_time()
{
    1e24:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e26:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e2a:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e2c:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e2e:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e32:	2501                	sext.w	a0,a0
    1e34:	ed09                	bnez	a0,1e4e <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e36:	67a2                	ld	a5,8(sp)
    1e38:	3e800713          	li	a4,1000
    1e3c:	00015503          	lhu	a0,0(sp)
    1e40:	02e7d7b3          	divu	a5,a5,a4
    1e44:	02e50533          	mul	a0,a0,a4
    1e48:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e4a:	0141                	addi	sp,sp,16
    1e4c:	8082                	ret
        return -1;
    1e4e:	557d                	li	a0,-1
    1e50:	bfed                	j	1e4a <get_time+0x26>

0000000000001e52 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e52:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e56:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <time>:
    register long a7 __asm__("a7") = n;
    1e5e:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e62:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e66:	2501                	sext.w	a0,a0
    1e68:	8082                	ret

0000000000001e6a <sleep>:

int sleep(unsigned long long time)
{
    1e6a:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e6c:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e6e:	850a                	mv	a0,sp
    1e70:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e72:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e76:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e78:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e7c:	e501                	bnez	a0,1e84 <sleep+0x1a>
    return 0;
    1e7e:	4501                	li	a0,0
}
    1e80:	0141                	addi	sp,sp,16
    1e82:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e84:	4502                	lw	a0,0(sp)
}
    1e86:	0141                	addi	sp,sp,16
    1e88:	8082                	ret

0000000000001e8a <set_priority>:
    register long a7 __asm__("a7") = n;
    1e8a:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e8e:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e96:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e9a:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e9e:	8082                	ret

0000000000001ea0 <munmap>:
    register long a7 __asm__("a7") = n;
    1ea0:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ea4:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <wait>:

int wait(int *code)
{
    1eac:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1eae:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1eb2:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1eb4:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1eb6:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1eb8:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ebc:	2501                	sext.w	a0,a0
    1ebe:	8082                	ret

0000000000001ec0 <spawn>:
    register long a7 __asm__("a7") = n;
    1ec0:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1ec4:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1ec8:	2501                	sext.w	a0,a0
    1eca:	8082                	ret

0000000000001ecc <mailread>:
    register long a7 __asm__("a7") = n;
    1ecc:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed0:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ed8:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1edc:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ee0:	2501                	sext.w	a0,a0
    1ee2:	8082                	ret

0000000000001ee4 <fstat>:
    register long a7 __asm__("a7") = n;
    1ee4:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ee8:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eec:	2501                	sext.w	a0,a0
    1eee:	8082                	ret

0000000000001ef0 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1ef0:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1ef2:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ef6:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ef8:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1f00:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f02:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1f06:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f08:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1f0c:	2501                	sext.w	a0,a0
    1f0e:	8082                	ret

0000000000001f10 <link>:

int link(char *old_path, char *new_path)
{
    1f10:	87aa                	mv	a5,a0
    1f12:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1f14:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f18:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f1c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f1e:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f22:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f24:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f28:	2501                	sext.w	a0,a0
    1f2a:	8082                	ret

0000000000001f2c <unlink>:

int unlink(char *path)
{
    1f2c:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f2e:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f32:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f36:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f38:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f3c:	2501                	sext.w	a0,a0
    1f3e:	8082                	ret

0000000000001f40 <uname>:
    register long a7 __asm__("a7") = n;
    1f40:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f44:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f48:	2501                	sext.w	a0,a0
    1f4a:	8082                	ret

0000000000001f4c <brk>:
    register long a7 __asm__("a7") = n;
    1f4c:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f50:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f54:	2501                	sext.w	a0,a0
    1f56:	8082                	ret

0000000000001f58 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f58:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f5a:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f5e:	8082                	ret

0000000000001f60 <chdir>:
    register long a7 __asm__("a7") = n;
    1f60:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f64:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f68:	2501                	sext.w	a0,a0
    1f6a:	8082                	ret

0000000000001f6c <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f6c:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f6e:	02059613          	slli	a2,a1,0x20
    1f72:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f74:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f78:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f7c:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f7e:	00000073          	ecall
}
    1f82:	2501                	sext.w	a0,a0
    1f84:	8082                	ret

0000000000001f86 <getdents>:
    register long a7 __asm__("a7") = n;
    1f86:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f8a:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f8e:	2501                	sext.w	a0,a0
    1f90:	8082                	ret

0000000000001f92 <pipe>:
    register long a7 __asm__("a7") = n;
    1f92:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f96:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f98:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f9c:	2501                	sext.w	a0,a0
    1f9e:	8082                	ret

0000000000001fa0 <dup>:
    register long a7 __asm__("a7") = n;
    1fa0:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1fa2:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1fa6:	2501                	sext.w	a0,a0
    1fa8:	8082                	ret

0000000000001faa <dup2>:
    register long a7 __asm__("a7") = n;
    1faa:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1fac:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1fae:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1fb2:	2501                	sext.w	a0,a0
    1fb4:	8082                	ret

0000000000001fb6 <mount>:
    register long a7 __asm__("a7") = n;
    1fb6:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fba:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fbe:	2501                	sext.w	a0,a0
    1fc0:	8082                	ret

0000000000001fc2 <umount>:
    register long a7 __asm__("a7") = n;
    1fc2:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fc6:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fc8:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fcc:	2501                	sext.w	a0,a0
    1fce:	8082                	ret

0000000000001fd0 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fd0:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fd2:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fd4:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fd6:	8532                	mv	a0,a2
	mv a2, a4
    1fd8:	863a                	mv	a2,a4
	mv a3, a5
    1fda:	86be                	mv	a3,a5
	mv a4, a6
    1fdc:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fde:	0dc00893          	li	a7,220
	ecall
    1fe2:	00000073          	ecall

	beqz a0, 1f
    1fe6:	c111                	beqz	a0,1fea <__clone+0x1a>
	# Parent
	ret
    1fe8:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fea:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fec:	6522                	ld	a0,8(sp)
	jalr a1
    1fee:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1ff0:	05d00893          	li	a7,93
	ecall
    1ff4:	00000073          	ecall
