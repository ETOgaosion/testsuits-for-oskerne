
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/fork:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0a80006f          	j	10aa <__start_main>

0000000000001006 <test_fork>:
 * 成功测试时子进程的输出：
 * "  child process."
 */
static int fd[2];

void test_fork(void){
    1006:	1101                	addi	sp,sp,-32
    TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fe050513          	addi	a0,a0,-32 # 1fe8 <__clone+0x2e>
void test_fork(void){
    1010:	ec06                	sd	ra,24(sp)
    TEST_START(__func__);
    1012:	298000ef          	jal	ra,12aa <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	08250513          	addi	a0,a0,130 # 2098 <__func__.1213>
    101e:	28c000ef          	jal	ra,12aa <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fde50513          	addi	a0,a0,-34 # 2000 <__clone+0x46>
    102a:	280000ef          	jal	ra,12aa <puts>
    int cpid, wstatus;
    cpid = fork();
    102e:	581000ef          	jal	ra,1dae <fork>
    assert(cpid != -1);
    1032:	57fd                	li	a5,-1
    1034:	04f50363          	beq	a0,a5,107a <test_fork+0x74>

    if(cpid > 0){
    1038:	04a05763          	blez	a0,1086 <test_fork+0x80>
	wait(&wstatus);
    103c:	0068                	addi	a0,sp,12
    103e:	659000ef          	jal	ra,1e96 <wait>
	printf("  parent process. wstatus:%d\n", wstatus);
    1042:	45b2                	lw	a1,12(sp)
    1044:	00001517          	auipc	a0,0x1
    1048:	fec50513          	addi	a0,a0,-20 # 2030 <__clone+0x76>
    104c:	280000ef          	jal	ra,12cc <printf>
    }else{
	printf("  child process.\n");
	exit(0);
    }
    TEST_END(__func__);
    1050:	00001517          	auipc	a0,0x1
    1054:	01850513          	addi	a0,a0,24 # 2068 <__clone+0xae>
    1058:	252000ef          	jal	ra,12aa <puts>
    105c:	00001517          	auipc	a0,0x1
    1060:	03c50513          	addi	a0,a0,60 # 2098 <__func__.1213>
    1064:	246000ef          	jal	ra,12aa <puts>
    1068:	00001517          	auipc	a0,0x1
    106c:	f9850513          	addi	a0,a0,-104 # 2000 <__clone+0x46>
    1070:	23a000ef          	jal	ra,12aa <puts>
}
    1074:	60e2                	ld	ra,24(sp)
    1076:	6105                	addi	sp,sp,32
    1078:	8082                	ret
    assert(cpid != -1);
    107a:	00001517          	auipc	a0,0x1
    107e:	f9650513          	addi	a0,a0,-106 # 2010 <__clone+0x56>
    1082:	4ee000ef          	jal	ra,1570 <panic>
	printf("  child process.\n");
    1086:	00001517          	auipc	a0,0x1
    108a:	fca50513          	addi	a0,a0,-54 # 2050 <__clone+0x96>
    108e:	23e000ef          	jal	ra,12cc <printf>
	exit(0);
    1092:	4501                	li	a0,0
    1094:	53f000ef          	jal	ra,1dd2 <exit>
    1098:	bf65                	j	1050 <test_fork+0x4a>

000000000000109a <main>:

int main(void){
    109a:	1141                	addi	sp,sp,-16
    109c:	e406                	sd	ra,8(sp)
    test_fork();
    109e:	f69ff0ef          	jal	ra,1006 <test_fork>
    return 0;
}
    10a2:	60a2                	ld	ra,8(sp)
    10a4:	4501                	li	a0,0
    10a6:	0141                	addi	sp,sp,16
    10a8:	8082                	ret

00000000000010aa <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    10aa:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    10ac:	4108                	lw	a0,0(a0)
{
    10ae:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10b0:	05a1                	addi	a1,a1,8
{
    10b2:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10b4:	fe7ff0ef          	jal	ra,109a <main>
    10b8:	51b000ef          	jal	ra,1dd2 <exit>
	return 0;
}
    10bc:	60a2                	ld	ra,8(sp)
    10be:	4501                	li	a0,0
    10c0:	0141                	addi	sp,sp,16
    10c2:	8082                	ret

00000000000010c4 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10c4:	7179                	addi	sp,sp,-48
    10c6:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10c8:	12054e63          	bltz	a0,1204 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10cc:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10d0:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10d2:	02b7f6bb          	remuw	a3,a5,a1
    10d6:	00001717          	auipc	a4,0x1
    10da:	fd270713          	addi	a4,a4,-46 # 20a8 <digits>
    buf[16] = 0;
    10de:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10e2:	1682                	slli	a3,a3,0x20
    10e4:	9281                	srli	a3,a3,0x20
    10e6:	96ba                	add	a3,a3,a4
    10e8:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10ec:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10f0:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10f4:	16b7e363          	bltu	a5,a1,125a <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10f8:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10fc:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1100:	1602                	slli	a2,a2,0x20
    1102:	9201                	srli	a2,a2,0x20
    1104:	963a                	add	a2,a2,a4
    1106:	00064603          	lbu	a2,0(a2)
    110a:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    110e:	0007861b          	sext.w	a2,a5
    1112:	12b6e863          	bltu	a3,a1,1242 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1116:	02b7f6bb          	remuw	a3,a5,a1
    111a:	1682                	slli	a3,a3,0x20
    111c:	9281                	srli	a3,a3,0x20
    111e:	96ba                	add	a3,a3,a4
    1120:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1124:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    1128:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    112c:	10b66e63          	bltu	a2,a1,1248 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1130:	02b876bb          	remuw	a3,a6,a1
    1134:	1682                	slli	a3,a3,0x20
    1136:	9281                	srli	a3,a3,0x20
    1138:	96ba                	add	a3,a3,a4
    113a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1142:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1146:	10b86463          	bltu	a6,a1,124e <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    114a:	02b676bb          	remuw	a3,a2,a1
    114e:	1682                	slli	a3,a3,0x20
    1150:	9281                	srli	a3,a3,0x20
    1152:	96ba                	add	a3,a3,a4
    1154:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1158:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    115c:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1160:	0eb66a63          	bltu	a2,a1,1254 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1164:	02b876bb          	remuw	a3,a6,a1
    1168:	1682                	slli	a3,a3,0x20
    116a:	9281                	srli	a3,a3,0x20
    116c:	96ba                	add	a3,a3,a4
    116e:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1172:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1176:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    117a:	0cb86163          	bltu	a6,a1,123c <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    117e:	02b676bb          	remuw	a3,a2,a1
    1182:	1682                	slli	a3,a3,0x20
    1184:	9281                	srli	a3,a3,0x20
    1186:	96ba                	add	a3,a3,a4
    1188:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    118c:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1190:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1194:	0cb66563          	bltu	a2,a1,125e <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1198:	02b876bb          	remuw	a3,a6,a1
    119c:	1682                	slli	a3,a3,0x20
    119e:	9281                	srli	a3,a3,0x20
    11a0:	96ba                	add	a3,a3,a4
    11a2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11a6:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    11aa:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11ae:	0ab86b63          	bltu	a6,a1,1264 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11b2:	02b676bb          	remuw	a3,a2,a1
    11b6:	1682                	slli	a3,a3,0x20
    11b8:	9281                	srli	a3,a3,0x20
    11ba:	96ba                	add	a3,a3,a4
    11bc:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11c0:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11c4:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11c8:	0ab66163          	bltu	a2,a1,126a <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11cc:	1782                	slli	a5,a5,0x20
    11ce:	9381                	srli	a5,a5,0x20
    11d0:	97ba                	add	a5,a5,a4
    11d2:	0007c703          	lbu	a4,0(a5)
    11d6:	4599                	li	a1,6
    11d8:	4795                	li	a5,5
    11da:	00e10723          	sb	a4,14(sp)

    if (sign)
    11de:	00055963          	bgez	a0,11f0 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11e2:	1018                	addi	a4,sp,32
    11e4:	973e                	add	a4,a4,a5
    11e6:	02d00693          	li	a3,45
    11ea:	fed70423          	sb	a3,-24(a4)
    11ee:	85be                	mv	a1,a5
    write(f, s, l);
    11f0:	003c                	addi	a5,sp,8
    11f2:	4641                	li	a2,16
    11f4:	9e0d                	subw	a2,a2,a1
    11f6:	4505                	li	a0,1
    11f8:	95be                	add	a1,a1,a5
    11fa:	387000ef          	jal	ra,1d80 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11fe:	70a2                	ld	ra,40(sp)
    1200:	6145                	addi	sp,sp,48
    1202:	8082                	ret
        x = -xx;
    1204:	40a0063b          	negw	a2,a0
    1208:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    120a:	02b677bb          	remuw	a5,a2,a1
    120e:	00001717          	auipc	a4,0x1
    1212:	e9a70713          	addi	a4,a4,-358 # 20a8 <digits>
    buf[16] = 0;
    1216:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    121a:	1782                	slli	a5,a5,0x20
    121c:	9381                	srli	a5,a5,0x20
    121e:	97ba                	add	a5,a5,a4
    1220:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1224:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    1228:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    122c:	ecb676e3          	bleu	a1,a2,10f8 <printint.constprop.0+0x34>
        buf[i--] = '-';
    1230:	02d00793          	li	a5,45
    1234:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    1238:	45b9                	li	a1,14
    123a:	bf5d                	j	11f0 <printint.constprop.0+0x12c>
    123c:	47a5                	li	a5,9
    123e:	45a9                	li	a1,10
    1240:	bf79                	j	11de <printint.constprop.0+0x11a>
    1242:	47b5                	li	a5,13
    1244:	45b9                	li	a1,14
    1246:	bf61                	j	11de <printint.constprop.0+0x11a>
    1248:	47b1                	li	a5,12
    124a:	45b5                	li	a1,13
    124c:	bf49                	j	11de <printint.constprop.0+0x11a>
    124e:	47ad                	li	a5,11
    1250:	45b1                	li	a1,12
    1252:	b771                	j	11de <printint.constprop.0+0x11a>
    1254:	47a9                	li	a5,10
    1256:	45ad                	li	a1,11
    1258:	b759                	j	11de <printint.constprop.0+0x11a>
    i = 15;
    125a:	45bd                	li	a1,15
    125c:	bf51                	j	11f0 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    125e:	47a1                	li	a5,8
    1260:	45a5                	li	a1,9
    1262:	bfb5                	j	11de <printint.constprop.0+0x11a>
    1264:	479d                	li	a5,7
    1266:	45a1                	li	a1,8
    1268:	bf9d                	j	11de <printint.constprop.0+0x11a>
    126a:	4799                	li	a5,6
    126c:	459d                	li	a1,7
    126e:	bf85                	j	11de <printint.constprop.0+0x11a>

0000000000001270 <getchar>:
{
    1270:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1272:	00f10593          	addi	a1,sp,15
    1276:	4605                	li	a2,1
    1278:	4501                	li	a0,0
{
    127a:	ec06                	sd	ra,24(sp)
    char byte = 0;
    127c:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1280:	2f7000ef          	jal	ra,1d76 <read>
}
    1284:	60e2                	ld	ra,24(sp)
    1286:	00f14503          	lbu	a0,15(sp)
    128a:	6105                	addi	sp,sp,32
    128c:	8082                	ret

000000000000128e <putchar>:
{
    128e:	1101                	addi	sp,sp,-32
    char byte = c;
    1290:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1294:	00f10593          	addi	a1,sp,15
    1298:	4605                	li	a2,1
    129a:	4505                	li	a0,1
{
    129c:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    129e:	2e3000ef          	jal	ra,1d80 <write>
}
    12a2:	60e2                	ld	ra,24(sp)
    12a4:	2501                	sext.w	a0,a0
    12a6:	6105                	addi	sp,sp,32
    12a8:	8082                	ret

00000000000012aa <puts>:
{
    12aa:	1141                	addi	sp,sp,-16
    12ac:	e406                	sd	ra,8(sp)
    12ae:	e022                	sd	s0,0(sp)
    12b0:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12b2:	5b2000ef          	jal	ra,1864 <strlen>
    12b6:	862a                	mv	a2,a0
    12b8:	85a2                	mv	a1,s0
    12ba:	4505                	li	a0,1
    12bc:	2c5000ef          	jal	ra,1d80 <write>
}
    12c0:	60a2                	ld	ra,8(sp)
    12c2:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12c4:	957d                	srai	a0,a0,0x3f
    return r;
    12c6:	2501                	sext.w	a0,a0
}
    12c8:	0141                	addi	sp,sp,16
    12ca:	8082                	ret

00000000000012cc <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12cc:	7131                	addi	sp,sp,-192
    12ce:	e0da                	sd	s6,64(sp)
    12d0:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12d2:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12d4:	013c                	addi	a5,sp,136
{
    12d6:	f0ca                	sd	s2,96(sp)
    12d8:	ecce                	sd	s3,88(sp)
    12da:	e8d2                	sd	s4,80(sp)
    12dc:	e4d6                	sd	s5,72(sp)
    12de:	fc5e                	sd	s7,56(sp)
    12e0:	fc86                	sd	ra,120(sp)
    12e2:	f8a2                	sd	s0,112(sp)
    12e4:	f4a6                	sd	s1,104(sp)
    12e6:	89aa                	mv	s3,a0
    12e8:	e52e                	sd	a1,136(sp)
    12ea:	e932                	sd	a2,144(sp)
    12ec:	ed36                	sd	a3,152(sp)
    12ee:	f13a                	sd	a4,160(sp)
    12f0:	f942                	sd	a6,176(sp)
    12f2:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12f4:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12f6:	02500913          	li	s2,37
    12fa:	07000a93          	li	s5,112
    buf[i++] = '0';
    12fe:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1302:	00001a17          	auipc	s4,0x1
    1306:	da6a0a13          	addi	s4,s4,-602 # 20a8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    130a:	00001b97          	auipc	s7,0x1
    130e:	d6eb8b93          	addi	s7,s7,-658 # 2078 <__clone+0xbe>
        if (!*s)
    1312:	0009c783          	lbu	a5,0(s3)
    1316:	cfb9                	beqz	a5,1374 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    1318:	23278d63          	beq	a5,s2,1552 <printf+0x286>
    131c:	864e                	mv	a2,s3
    131e:	a019                	j	1324 <printf+0x58>
    1320:	07278563          	beq	a5,s2,138a <printf+0xbe>
    1324:	0605                	addi	a2,a2,1
    1326:	00064783          	lbu	a5,0(a2)
    132a:	fbfd                	bnez	a5,1320 <printf+0x54>
    132c:	84b2                	mv	s1,a2
        l = z - a;
    132e:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1332:	8622                	mv	a2,s0
    1334:	85ce                	mv	a1,s3
    1336:	4505                	li	a0,1
    1338:	249000ef          	jal	ra,1d80 <write>
        if (l)
    133c:	ec3d                	bnez	s0,13ba <printf+0xee>
        if (s[1] == 0)
    133e:	0014c783          	lbu	a5,1(s1)
    1342:	cb8d                	beqz	a5,1374 <printf+0xa8>
        switch (s[1])
    1344:	09578b63          	beq	a5,s5,13da <printf+0x10e>
    1348:	06fafb63          	bleu	a5,s5,13be <printf+0xf2>
    134c:	07300713          	li	a4,115
    1350:	1ce78e63          	beq	a5,a4,152c <printf+0x260>
    1354:	07800713          	li	a4,120
    1358:	1ae79563          	bne	a5,a4,1502 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    135c:	6782                	ld	a5,0(sp)
    135e:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1360:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1364:	4388                	lw	a0,0(a5)
    1366:	07a1                	addi	a5,a5,8
    1368:	e03e                	sd	a5,0(sp)
    136a:	d5bff0ef          	jal	ra,10c4 <printint.constprop.0>
        if (!*s)
    136e:	0009c783          	lbu	a5,0(s3)
    1372:	f3dd                	bnez	a5,1318 <printf+0x4c>
    }
    va_end(ap);
}
    1374:	70e6                	ld	ra,120(sp)
    1376:	7446                	ld	s0,112(sp)
    1378:	74a6                	ld	s1,104(sp)
    137a:	7906                	ld	s2,96(sp)
    137c:	69e6                	ld	s3,88(sp)
    137e:	6a46                	ld	s4,80(sp)
    1380:	6aa6                	ld	s5,72(sp)
    1382:	6b06                	ld	s6,64(sp)
    1384:	7be2                	ld	s7,56(sp)
    1386:	6129                	addi	sp,sp,192
    1388:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    138a:	00164783          	lbu	a5,1(a2)
    138e:	84b2                	mv	s1,a2
    1390:	01278763          	beq	a5,s2,139e <printf+0xd2>
    1394:	bf69                	j	132e <printf+0x62>
    1396:	0014c783          	lbu	a5,1(s1)
    139a:	f9279ae3          	bne	a5,s2,132e <printf+0x62>
    139e:	0489                	addi	s1,s1,2
    13a0:	0004c783          	lbu	a5,0(s1)
    13a4:	0605                	addi	a2,a2,1
    13a6:	ff2788e3          	beq	a5,s2,1396 <printf+0xca>
        l = z - a;
    13aa:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13ae:	8622                	mv	a2,s0
    13b0:	85ce                	mv	a1,s3
    13b2:	4505                	li	a0,1
    13b4:	1cd000ef          	jal	ra,1d80 <write>
        if (l)
    13b8:	d059                	beqz	s0,133e <printf+0x72>
    13ba:	89a6                	mv	s3,s1
    13bc:	bf99                	j	1312 <printf+0x46>
    13be:	06400713          	li	a4,100
    13c2:	14e79063          	bne	a5,a4,1502 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13c6:	6782                	ld	a5,0(sp)
    13c8:	45a9                	li	a1,10
        s += 2;
    13ca:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13ce:	4388                	lw	a0,0(a5)
    13d0:	07a1                	addi	a5,a5,8
    13d2:	e03e                	sd	a5,0(sp)
    13d4:	cf1ff0ef          	jal	ra,10c4 <printint.constprop.0>
        s += 2;
    13d8:	bf59                	j	136e <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13da:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13dc:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13e0:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13e2:	631c                	ld	a5,0(a4)
    13e4:	0721                	addi	a4,a4,8
    13e6:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13e8:	00479293          	slli	t0,a5,0x4
    13ec:	00879f93          	slli	t6,a5,0x8
    13f0:	00c79f13          	slli	t5,a5,0xc
    13f4:	01079e93          	slli	t4,a5,0x10
    13f8:	01479e13          	slli	t3,a5,0x14
    13fc:	01879313          	slli	t1,a5,0x18
    1400:	01c79893          	slli	a7,a5,0x1c
    1404:	02479813          	slli	a6,a5,0x24
    1408:	02879513          	slli	a0,a5,0x28
    140c:	02c79593          	slli	a1,a5,0x2c
    1410:	03079693          	slli	a3,a5,0x30
    1414:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1418:	03c7d413          	srli	s0,a5,0x3c
    141c:	01c7d39b          	srliw	t2,a5,0x1c
    1420:	03c2d293          	srli	t0,t0,0x3c
    1424:	03cfdf93          	srli	t6,t6,0x3c
    1428:	03cf5f13          	srli	t5,t5,0x3c
    142c:	03cede93          	srli	t4,t4,0x3c
    1430:	03ce5e13          	srli	t3,t3,0x3c
    1434:	03c35313          	srli	t1,t1,0x3c
    1438:	03c8d893          	srli	a7,a7,0x3c
    143c:	03c85813          	srli	a6,a6,0x3c
    1440:	9171                	srli	a0,a0,0x3c
    1442:	91f1                	srli	a1,a1,0x3c
    1444:	92f1                	srli	a3,a3,0x3c
    1446:	9371                	srli	a4,a4,0x3c
    1448:	96d2                	add	a3,a3,s4
    144a:	9752                	add	a4,a4,s4
    144c:	9452                	add	s0,s0,s4
    144e:	92d2                	add	t0,t0,s4
    1450:	9fd2                	add	t6,t6,s4
    1452:	9f52                	add	t5,t5,s4
    1454:	9ed2                	add	t4,t4,s4
    1456:	9e52                	add	t3,t3,s4
    1458:	9352                	add	t1,t1,s4
    145a:	98d2                	add	a7,a7,s4
    145c:	93d2                	add	t2,t2,s4
    145e:	9852                	add	a6,a6,s4
    1460:	9552                	add	a0,a0,s4
    1462:	95d2                	add	a1,a1,s4
    1464:	0006c983          	lbu	s3,0(a3)
    1468:	0002c283          	lbu	t0,0(t0)
    146c:	00074683          	lbu	a3,0(a4)
    1470:	000fcf83          	lbu	t6,0(t6)
    1474:	000f4f03          	lbu	t5,0(t5)
    1478:	000ece83          	lbu	t4,0(t4)
    147c:	000e4e03          	lbu	t3,0(t3)
    1480:	00034303          	lbu	t1,0(t1)
    1484:	0008c883          	lbu	a7,0(a7)
    1488:	0003c383          	lbu	t2,0(t2)
    148c:	00084803          	lbu	a6,0(a6)
    1490:	00054503          	lbu	a0,0(a0)
    1494:	0005c583          	lbu	a1,0(a1)
    1498:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    149c:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14a0:	9371                	srli	a4,a4,0x3c
    14a2:	8bbd                	andi	a5,a5,15
    14a4:	9752                	add	a4,a4,s4
    14a6:	97d2                	add	a5,a5,s4
    14a8:	005105a3          	sb	t0,11(sp)
    14ac:	01f10623          	sb	t6,12(sp)
    14b0:	01e106a3          	sb	t5,13(sp)
    14b4:	01d10723          	sb	t4,14(sp)
    14b8:	01c107a3          	sb	t3,15(sp)
    14bc:	00610823          	sb	t1,16(sp)
    14c0:	011108a3          	sb	a7,17(sp)
    14c4:	00710923          	sb	t2,18(sp)
    14c8:	010109a3          	sb	a6,19(sp)
    14cc:	00a10a23          	sb	a0,20(sp)
    14d0:	00b10aa3          	sb	a1,21(sp)
    14d4:	01310b23          	sb	s3,22(sp)
    14d8:	00d10ba3          	sb	a3,23(sp)
    14dc:	00810523          	sb	s0,10(sp)
    14e0:	00074703          	lbu	a4,0(a4)
    14e4:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14e8:	002c                	addi	a1,sp,8
    14ea:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14ec:	00e10c23          	sb	a4,24(sp)
    14f0:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14f4:	00010d23          	sb	zero,26(sp)
        s += 2;
    14f8:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14fc:	085000ef          	jal	ra,1d80 <write>
        s += 2;
    1500:	b5bd                	j	136e <printf+0xa2>
    char byte = c;
    1502:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    1506:	4605                	li	a2,1
    1508:	002c                	addi	a1,sp,8
    150a:	4505                	li	a0,1
    char byte = c;
    150c:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1510:	071000ef          	jal	ra,1d80 <write>
    char byte = c;
    1514:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    1518:	4605                	li	a2,1
    151a:	002c                	addi	a1,sp,8
    151c:	4505                	li	a0,1
    char byte = c;
    151e:	00f10423          	sb	a5,8(sp)
        s += 2;
    1522:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1526:	05b000ef          	jal	ra,1d80 <write>
        s += 2;
    152a:	b591                	j	136e <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    152c:	6782                	ld	a5,0(sp)
    152e:	6380                	ld	s0,0(a5)
    1530:	07a1                	addi	a5,a5,8
    1532:	e03e                	sd	a5,0(sp)
    1534:	cc05                	beqz	s0,156c <printf+0x2a0>
            l = strnlen(a, 200);
    1536:	0c800593          	li	a1,200
    153a:	8522                	mv	a0,s0
    153c:	45a000ef          	jal	ra,1996 <strnlen>
    write(f, s, l);
    1540:	0005061b          	sext.w	a2,a0
    1544:	85a2                	mv	a1,s0
    1546:	4505                	li	a0,1
    1548:	039000ef          	jal	ra,1d80 <write>
        s += 2;
    154c:	00248993          	addi	s3,s1,2
    1550:	bd39                	j	136e <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1552:	0019c783          	lbu	a5,1(s3)
    1556:	84ce                	mv	s1,s3
    1558:	864e                	mv	a2,s3
    155a:	e52782e3          	beq	a5,s2,139e <printf+0xd2>
    write(f, s, l);
    155e:	4601                	li	a2,0
    1560:	85ce                	mv	a1,s3
    1562:	4505                	li	a0,1
    1564:	01d000ef          	jal	ra,1d80 <write>
    1568:	84ce                	mv	s1,s3
    156a:	bbd1                	j	133e <printf+0x72>
                a = "(null)";
    156c:	845e                	mv	s0,s7
    156e:	b7e1                	j	1536 <printf+0x26a>

0000000000001570 <panic>:
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void panic(char *m)
{
    1570:	1141                	addi	sp,sp,-16
    1572:	e406                	sd	ra,8(sp)
    puts(m);
    1574:	d37ff0ef          	jal	ra,12aa <puts>
    exit(-100);
}
    1578:	60a2                	ld	ra,8(sp)
    exit(-100);
    157a:	f9c00513          	li	a0,-100
}
    157e:	0141                	addi	sp,sp,16
    exit(-100);
    1580:	0530006f          	j	1dd2 <exit>

0000000000001584 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1584:	02000793          	li	a5,32
    1588:	00f50663          	beq	a0,a5,1594 <isspace+0x10>
    158c:	355d                	addiw	a0,a0,-9
    158e:	00553513          	sltiu	a0,a0,5
    1592:	8082                	ret
    1594:	4505                	li	a0,1
}
    1596:	8082                	ret

0000000000001598 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1598:	fd05051b          	addiw	a0,a0,-48
}
    159c:	00a53513          	sltiu	a0,a0,10
    15a0:	8082                	ret

00000000000015a2 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    15a2:	02000613          	li	a2,32
    15a6:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    15a8:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    15ac:	0007079b          	sext.w	a5,a4
    15b0:	ff77869b          	addiw	a3,a5,-9
    15b4:	04c70b63          	beq	a4,a2,160a <atoi+0x68>
    15b8:	04d5f963          	bleu	a3,a1,160a <atoi+0x68>
        s++;
    switch (*s)
    15bc:	02b00693          	li	a3,43
    15c0:	04d70a63          	beq	a4,a3,1614 <atoi+0x72>
    15c4:	02d00693          	li	a3,45
    15c8:	06d70463          	beq	a4,a3,1630 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15cc:	fd07859b          	addiw	a1,a5,-48
    15d0:	4625                	li	a2,9
    15d2:	873e                	mv	a4,a5
    15d4:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15d6:	4e01                	li	t3,0
    while (isdigit(*s))
    15d8:	04b66a63          	bltu	a2,a1,162c <atoi+0x8a>
    int n = 0, neg = 0;
    15dc:	4501                	li	a0,0
    while (isdigit(*s))
    15de:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15e0:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15e2:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15e6:	0025179b          	slliw	a5,a0,0x2
    15ea:	9d3d                	addw	a0,a0,a5
    15ec:	fd07031b          	addiw	t1,a4,-48
    15f0:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15f4:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15f8:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15fc:	0006071b          	sext.w	a4,a2
    1600:	feb870e3          	bleu	a1,a6,15e0 <atoi+0x3e>
    return neg ? n : -n;
    1604:	000e0563          	beqz	t3,160e <atoi+0x6c>
}
    1608:	8082                	ret
        s++;
    160a:	0505                	addi	a0,a0,1
    160c:	bf71                	j	15a8 <atoi+0x6>
    160e:	4113053b          	subw	a0,t1,a7
    1612:	8082                	ret
    while (isdigit(*s))
    1614:	00154783          	lbu	a5,1(a0)
    1618:	4625                	li	a2,9
        s++;
    161a:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    161e:	fd07859b          	addiw	a1,a5,-48
    1622:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1626:	4e01                	li	t3,0
    while (isdigit(*s))
    1628:	fab67ae3          	bleu	a1,a2,15dc <atoi+0x3a>
    162c:	4501                	li	a0,0
}
    162e:	8082                	ret
    while (isdigit(*s))
    1630:	00154783          	lbu	a5,1(a0)
    1634:	4625                	li	a2,9
        s++;
    1636:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    163a:	fd07859b          	addiw	a1,a5,-48
    163e:	0007871b          	sext.w	a4,a5
    1642:	feb665e3          	bltu	a2,a1,162c <atoi+0x8a>
        neg = 1;
    1646:	4e05                	li	t3,1
    1648:	bf51                	j	15dc <atoi+0x3a>

000000000000164a <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    164a:	16060d63          	beqz	a2,17c4 <memset+0x17a>
    164e:	40a007b3          	neg	a5,a0
    1652:	8b9d                	andi	a5,a5,7
    1654:	00778713          	addi	a4,a5,7
    1658:	482d                	li	a6,11
    165a:	0ff5f593          	andi	a1,a1,255
    165e:	fff60693          	addi	a3,a2,-1
    1662:	17076263          	bltu	a4,a6,17c6 <memset+0x17c>
    1666:	16e6ea63          	bltu	a3,a4,17da <memset+0x190>
    166a:	16078563          	beqz	a5,17d4 <memset+0x18a>
    166e:	00b50023          	sb	a1,0(a0)
    1672:	4705                	li	a4,1
    1674:	00150e93          	addi	t4,a0,1
    1678:	14e78c63          	beq	a5,a4,17d0 <memset+0x186>
    167c:	00b500a3          	sb	a1,1(a0)
    1680:	4709                	li	a4,2
    1682:	00250e93          	addi	t4,a0,2
    1686:	14e78d63          	beq	a5,a4,17e0 <memset+0x196>
    168a:	00b50123          	sb	a1,2(a0)
    168e:	470d                	li	a4,3
    1690:	00350e93          	addi	t4,a0,3
    1694:	12e78b63          	beq	a5,a4,17ca <memset+0x180>
    1698:	00b501a3          	sb	a1,3(a0)
    169c:	4711                	li	a4,4
    169e:	00450e93          	addi	t4,a0,4
    16a2:	14e78163          	beq	a5,a4,17e4 <memset+0x19a>
    16a6:	00b50223          	sb	a1,4(a0)
    16aa:	4715                	li	a4,5
    16ac:	00550e93          	addi	t4,a0,5
    16b0:	12e78c63          	beq	a5,a4,17e8 <memset+0x19e>
    16b4:	00b502a3          	sb	a1,5(a0)
    16b8:	471d                	li	a4,7
    16ba:	00650e93          	addi	t4,a0,6
    16be:	12e79763          	bne	a5,a4,17ec <memset+0x1a2>
    16c2:	00750e93          	addi	t4,a0,7
    16c6:	00b50323          	sb	a1,6(a0)
    16ca:	4f1d                	li	t5,7
    16cc:	00859713          	slli	a4,a1,0x8
    16d0:	8f4d                	or	a4,a4,a1
    16d2:	01059e13          	slli	t3,a1,0x10
    16d6:	01c76e33          	or	t3,a4,t3
    16da:	01859313          	slli	t1,a1,0x18
    16de:	006e6333          	or	t1,t3,t1
    16e2:	02059893          	slli	a7,a1,0x20
    16e6:	011368b3          	or	a7,t1,a7
    16ea:	02859813          	slli	a6,a1,0x28
    16ee:	40f60333          	sub	t1,a2,a5
    16f2:	0108e833          	or	a6,a7,a6
    16f6:	03059693          	slli	a3,a1,0x30
    16fa:	00d866b3          	or	a3,a6,a3
    16fe:	03859713          	slli	a4,a1,0x38
    1702:	97aa                	add	a5,a5,a0
    1704:	ff837813          	andi	a6,t1,-8
    1708:	8f55                	or	a4,a4,a3
    170a:	00f806b3          	add	a3,a6,a5
    170e:	e398                	sd	a4,0(a5)
    1710:	07a1                	addi	a5,a5,8
    1712:	fed79ee3          	bne	a5,a3,170e <memset+0xc4>
    1716:	ff837693          	andi	a3,t1,-8
    171a:	00de87b3          	add	a5,t4,a3
    171e:	01e6873b          	addw	a4,a3,t5
    1722:	0ad30663          	beq	t1,a3,17ce <memset+0x184>
    1726:	00b78023          	sb	a1,0(a5)
    172a:	0017069b          	addiw	a3,a4,1
    172e:	08c6fb63          	bleu	a2,a3,17c4 <memset+0x17a>
    1732:	00b780a3          	sb	a1,1(a5)
    1736:	0027069b          	addiw	a3,a4,2
    173a:	08c6f563          	bleu	a2,a3,17c4 <memset+0x17a>
    173e:	00b78123          	sb	a1,2(a5)
    1742:	0037069b          	addiw	a3,a4,3
    1746:	06c6ff63          	bleu	a2,a3,17c4 <memset+0x17a>
    174a:	00b781a3          	sb	a1,3(a5)
    174e:	0047069b          	addiw	a3,a4,4
    1752:	06c6f963          	bleu	a2,a3,17c4 <memset+0x17a>
    1756:	00b78223          	sb	a1,4(a5)
    175a:	0057069b          	addiw	a3,a4,5
    175e:	06c6f363          	bleu	a2,a3,17c4 <memset+0x17a>
    1762:	00b782a3          	sb	a1,5(a5)
    1766:	0067069b          	addiw	a3,a4,6
    176a:	04c6fd63          	bleu	a2,a3,17c4 <memset+0x17a>
    176e:	00b78323          	sb	a1,6(a5)
    1772:	0077069b          	addiw	a3,a4,7
    1776:	04c6f763          	bleu	a2,a3,17c4 <memset+0x17a>
    177a:	00b783a3          	sb	a1,7(a5)
    177e:	0087069b          	addiw	a3,a4,8
    1782:	04c6f163          	bleu	a2,a3,17c4 <memset+0x17a>
    1786:	00b78423          	sb	a1,8(a5)
    178a:	0097069b          	addiw	a3,a4,9
    178e:	02c6fb63          	bleu	a2,a3,17c4 <memset+0x17a>
    1792:	00b784a3          	sb	a1,9(a5)
    1796:	00a7069b          	addiw	a3,a4,10
    179a:	02c6f563          	bleu	a2,a3,17c4 <memset+0x17a>
    179e:	00b78523          	sb	a1,10(a5)
    17a2:	00b7069b          	addiw	a3,a4,11
    17a6:	00c6ff63          	bleu	a2,a3,17c4 <memset+0x17a>
    17aa:	00b785a3          	sb	a1,11(a5)
    17ae:	00c7069b          	addiw	a3,a4,12
    17b2:	00c6f963          	bleu	a2,a3,17c4 <memset+0x17a>
    17b6:	00b78623          	sb	a1,12(a5)
    17ba:	2735                	addiw	a4,a4,13
    17bc:	00c77463          	bleu	a2,a4,17c4 <memset+0x17a>
    17c0:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17c4:	8082                	ret
    17c6:	472d                	li	a4,11
    17c8:	bd79                	j	1666 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17ca:	4f0d                	li	t5,3
    17cc:	b701                	j	16cc <memset+0x82>
    17ce:	8082                	ret
    17d0:	4f05                	li	t5,1
    17d2:	bded                	j	16cc <memset+0x82>
    17d4:	8eaa                	mv	t4,a0
    17d6:	4f01                	li	t5,0
    17d8:	bdd5                	j	16cc <memset+0x82>
    17da:	87aa                	mv	a5,a0
    17dc:	4701                	li	a4,0
    17de:	b7a1                	j	1726 <memset+0xdc>
    17e0:	4f09                	li	t5,2
    17e2:	b5ed                	j	16cc <memset+0x82>
    17e4:	4f11                	li	t5,4
    17e6:	b5dd                	j	16cc <memset+0x82>
    17e8:	4f15                	li	t5,5
    17ea:	b5cd                	j	16cc <memset+0x82>
    17ec:	4f19                	li	t5,6
    17ee:	bdf9                	j	16cc <memset+0x82>

00000000000017f0 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17f0:	00054703          	lbu	a4,0(a0)
    17f4:	0005c783          	lbu	a5,0(a1)
    17f8:	00e79b63          	bne	a5,a4,180e <strcmp+0x1e>
    17fc:	cf89                	beqz	a5,1816 <strcmp+0x26>
    17fe:	0505                	addi	a0,a0,1
    1800:	0585                	addi	a1,a1,1
    1802:	0005c783          	lbu	a5,0(a1)
    1806:	00054703          	lbu	a4,0(a0)
    180a:	fef709e3          	beq	a4,a5,17fc <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    180e:	0007051b          	sext.w	a0,a4
}
    1812:	9d1d                	subw	a0,a0,a5
    1814:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    1816:	4501                	li	a0,0
}
    1818:	9d1d                	subw	a0,a0,a5
    181a:	8082                	ret

000000000000181c <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    181c:	c231                	beqz	a2,1860 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    181e:	00054783          	lbu	a5,0(a0)
    1822:	0005c683          	lbu	a3,0(a1)
    1826:	c795                	beqz	a5,1852 <strncmp+0x36>
    1828:	ca85                	beqz	a3,1858 <strncmp+0x3c>
    if (!n--)
    182a:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    182c:	c615                	beqz	a2,1858 <strncmp+0x3c>
    182e:	00150713          	addi	a4,a0,1
    1832:	9532                	add	a0,a0,a2
    1834:	00d78963          	beq	a5,a3,1846 <strncmp+0x2a>
    1838:	a005                	j	1858 <strncmp+0x3c>
    183a:	ce99                	beqz	a3,1858 <strncmp+0x3c>
    183c:	00e50e63          	beq	a0,a4,1858 <strncmp+0x3c>
    1840:	0705                	addi	a4,a4,1
    1842:	00d79b63          	bne	a5,a3,1858 <strncmp+0x3c>
    1846:	00074783          	lbu	a5,0(a4)
    184a:	0585                	addi	a1,a1,1
    184c:	0005c683          	lbu	a3,0(a1)
    1850:	f7ed                	bnez	a5,183a <strncmp+0x1e>
    1852:	4501                	li	a0,0
        ;
    return *l - *r;
    1854:	9d15                	subw	a0,a0,a3
    1856:	8082                	ret
    1858:	0007851b          	sext.w	a0,a5
    185c:	9d15                	subw	a0,a0,a3
    185e:	8082                	ret
        return 0;
    1860:	4501                	li	a0,0
}
    1862:	8082                	ret

0000000000001864 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1864:	00757793          	andi	a5,a0,7
    1868:	cfa1                	beqz	a5,18c0 <strlen+0x5c>
        if (!*s)
    186a:	00054783          	lbu	a5,0(a0)
    186e:	cbb9                	beqz	a5,18c4 <strlen+0x60>
    1870:	87aa                	mv	a5,a0
    1872:	a021                	j	187a <strlen+0x16>
    1874:	0007c703          	lbu	a4,0(a5)
    1878:	c329                	beqz	a4,18ba <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    187a:	0785                	addi	a5,a5,1
    187c:	0077f713          	andi	a4,a5,7
    1880:	fb75                	bnez	a4,1874 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1882:	00000717          	auipc	a4,0x0
    1886:	7fe70713          	addi	a4,a4,2046 # 2080 <__clone+0xc6>
    188a:	630c                	ld	a1,0(a4)
    188c:	00000717          	auipc	a4,0x0
    1890:	7fc70713          	addi	a4,a4,2044 # 2088 <__clone+0xce>
    1894:	6394                	ld	a3,0(a5)
    1896:	6310                	ld	a2,0(a4)
    1898:	a019                	j	189e <strlen+0x3a>
    189a:	07a1                	addi	a5,a5,8
    189c:	6394                	ld	a3,0(a5)
    189e:	00b68733          	add	a4,a3,a1
    18a2:	fff6c693          	not	a3,a3
    18a6:	8f75                	and	a4,a4,a3
    18a8:	8f71                	and	a4,a4,a2
    18aa:	db65                	beqz	a4,189a <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    18ac:	0007c703          	lbu	a4,0(a5)
    18b0:	c709                	beqz	a4,18ba <strlen+0x56>
    18b2:	0785                	addi	a5,a5,1
    18b4:	0007c703          	lbu	a4,0(a5)
    18b8:	ff6d                	bnez	a4,18b2 <strlen+0x4e>
        ;
    return s - a;
    18ba:	40a78533          	sub	a0,a5,a0
}
    18be:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    18c0:	87aa                	mv	a5,a0
    18c2:	b7c1                	j	1882 <strlen+0x1e>
        if (!*s)
    18c4:	4501                	li	a0,0
            return s - a;
    18c6:	8082                	ret

00000000000018c8 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18c8:	00757793          	andi	a5,a0,7
    18cc:	0ff5f593          	andi	a1,a1,255
    18d0:	cb99                	beqz	a5,18e6 <memchr+0x1e>
    18d2:	c655                	beqz	a2,197e <memchr+0xb6>
    18d4:	00054783          	lbu	a5,0(a0)
    18d8:	0ab78663          	beq	a5,a1,1984 <memchr+0xbc>
    18dc:	0505                	addi	a0,a0,1
    18de:	00757793          	andi	a5,a0,7
    18e2:	167d                	addi	a2,a2,-1
    18e4:	f7fd                	bnez	a5,18d2 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18e6:	4701                	li	a4,0
    if (n && *s != c)
    18e8:	ca49                	beqz	a2,197a <memchr+0xb2>
    18ea:	00054783          	lbu	a5,0(a0)
    18ee:	08b78b63          	beq	a5,a1,1984 <memchr+0xbc>
        size_t k = ONES * c;
    18f2:	00000797          	auipc	a5,0x0
    18f6:	79e78793          	addi	a5,a5,1950 # 2090 <__clone+0xd6>
    18fa:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18fc:	479d                	li	a5,7
        size_t k = ONES * c;
    18fe:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1902:	08c7f863          	bleu	a2,a5,1992 <memchr+0xca>
    1906:	611c                	ld	a5,0(a0)
    1908:	00000317          	auipc	t1,0x0
    190c:	78030313          	addi	t1,t1,1920 # 2088 <__clone+0xce>
    1910:	00033803          	ld	a6,0(t1)
    1914:	00f8c7b3          	xor	a5,a7,a5
    1918:	fff7c713          	not	a4,a5
    191c:	8f95                	sub	a5,a5,a3
    191e:	8ff9                	and	a5,a5,a4
    1920:	0107f7b3          	and	a5,a5,a6
    1924:	e7bd                	bnez	a5,1992 <memchr+0xca>
    1926:	4e1d                	li	t3,7
    1928:	00000e97          	auipc	t4,0x0
    192c:	758e8e93          	addi	t4,t4,1880 # 2080 <__clone+0xc6>
    1930:	a005                	j	1950 <memchr+0x88>
    1932:	6514                	ld	a3,8(a0)
    1934:	000eb783          	ld	a5,0(t4)
    1938:	00033803          	ld	a6,0(t1)
    193c:	00d8c6b3          	xor	a3,a7,a3
    1940:	97b6                	add	a5,a5,a3
    1942:	fff6c693          	not	a3,a3
    1946:	8ff5                	and	a5,a5,a3
    1948:	0107f7b3          	and	a5,a5,a6
    194c:	e3a1                	bnez	a5,198c <memchr+0xc4>
    194e:	853a                	mv	a0,a4
    1950:	1661                	addi	a2,a2,-8
    1952:	00850713          	addi	a4,a0,8
    1956:	fcce6ee3          	bltu	t3,a2,1932 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    195a:	c215                	beqz	a2,197e <memchr+0xb6>
    195c:	00074783          	lbu	a5,0(a4)
    1960:	00f58d63          	beq	a1,a5,197a <memchr+0xb2>
    1964:	00170793          	addi	a5,a4,1
    1968:	963a                	add	a2,a2,a4
    196a:	873e                	mv	a4,a5
    196c:	00f60963          	beq	a2,a5,197e <memchr+0xb6>
    1970:	0007c683          	lbu	a3,0(a5)
    1974:	0785                	addi	a5,a5,1
    1976:	feb69ae3          	bne	a3,a1,196a <memchr+0xa2>
}
    197a:	853a                	mv	a0,a4
    197c:	8082                	ret
    return n ? (void *)s : 0;
    197e:	4701                	li	a4,0
}
    1980:	853a                	mv	a0,a4
    1982:	8082                	ret
    1984:	872a                	mv	a4,a0
    1986:	00074783          	lbu	a5,0(a4)
    198a:	bfd9                	j	1960 <memchr+0x98>
    198c:	00854783          	lbu	a5,8(a0)
    1990:	bfc1                	j	1960 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1992:	872a                	mv	a4,a0
    1994:	bfc1                	j	1964 <memchr+0x9c>

0000000000001996 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1996:	00757793          	andi	a5,a0,7
    199a:	cfc5                	beqz	a5,1a52 <strnlen+0xbc>
    199c:	c1c5                	beqz	a1,1a3c <strnlen+0xa6>
    199e:	00054783          	lbu	a5,0(a0)
    19a2:	cfd9                	beqz	a5,1a40 <strnlen+0xaa>
    19a4:	87ae                	mv	a5,a1
    19a6:	86aa                	mv	a3,a0
    19a8:	a029                	j	19b2 <strnlen+0x1c>
    19aa:	cbc9                	beqz	a5,1a3c <strnlen+0xa6>
    19ac:	0006c703          	lbu	a4,0(a3)
    19b0:	cb51                	beqz	a4,1a44 <strnlen+0xae>
    19b2:	0685                	addi	a3,a3,1
    19b4:	0076f713          	andi	a4,a3,7
    19b8:	17fd                	addi	a5,a5,-1
    19ba:	fb65                	bnez	a4,19aa <strnlen+0x14>
    if (n && *s != c)
    19bc:	c3c1                	beqz	a5,1a3c <strnlen+0xa6>
    19be:	0006c703          	lbu	a4,0(a3)
    19c2:	c349                	beqz	a4,1a44 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19c4:	471d                	li	a4,7
    19c6:	08f77a63          	bleu	a5,a4,1a5a <strnlen+0xc4>
    19ca:	00000e17          	auipc	t3,0x0
    19ce:	6b6e0e13          	addi	t3,t3,1718 # 2080 <__clone+0xc6>
    19d2:	6290                	ld	a2,0(a3)
    19d4:	000e3703          	ld	a4,0(t3)
    19d8:	00000e97          	auipc	t4,0x0
    19dc:	6b0e8e93          	addi	t4,t4,1712 # 2088 <__clone+0xce>
    19e0:	000eb803          	ld	a6,0(t4)
    19e4:	9732                	add	a4,a4,a2
    19e6:	fff64613          	not	a2,a2
    19ea:	8f71                	and	a4,a4,a2
    19ec:	01077733          	and	a4,a4,a6
    19f0:	e72d                	bnez	a4,1a5a <strnlen+0xc4>
    19f2:	4f1d                	li	t5,7
    19f4:	a839                	j	1a12 <strnlen+0x7c>
    19f6:	6698                	ld	a4,8(a3)
    19f8:	000e3303          	ld	t1,0(t3)
    19fc:	000eb803          	ld	a6,0(t4)
    1a00:	fff74893          	not	a7,a4
    1a04:	971a                	add	a4,a4,t1
    1a06:	01177733          	and	a4,a4,a7
    1a0a:	01077733          	and	a4,a4,a6
    1a0e:	ef1d                	bnez	a4,1a4c <strnlen+0xb6>
    1a10:	86b2                	mv	a3,a2
    1a12:	17e1                	addi	a5,a5,-8
    1a14:	00868613          	addi	a2,a3,8
    1a18:	fcff6fe3          	bltu	t5,a5,19f6 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    1a1c:	c385                	beqz	a5,1a3c <strnlen+0xa6>
    1a1e:	00064703          	lbu	a4,0(a2)
    1a22:	cb19                	beqz	a4,1a38 <strnlen+0xa2>
    1a24:	00160713          	addi	a4,a2,1
    1a28:	97b2                	add	a5,a5,a2
    1a2a:	863a                	mv	a2,a4
    1a2c:	00e78863          	beq	a5,a4,1a3c <strnlen+0xa6>
    1a30:	0705                	addi	a4,a4,1
    1a32:	fff74683          	lbu	a3,-1(a4)
    1a36:	faf5                	bnez	a3,1a2a <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a38:	40a605b3          	sub	a1,a2,a0
}
    1a3c:	852e                	mv	a0,a1
    1a3e:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a40:	87ae                	mv	a5,a1
    1a42:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a44:	8636                	mv	a2,a3
    1a46:	00064703          	lbu	a4,0(a2)
    1a4a:	bfe1                	j	1a22 <strnlen+0x8c>
    1a4c:	0086c703          	lbu	a4,8(a3)
    1a50:	bfc9                	j	1a22 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a52:	87ae                	mv	a5,a1
    1a54:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a56:	f7a5                	bnez	a5,19be <strnlen+0x28>
    1a58:	b7d5                	j	1a3c <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a5a:	8636                	mv	a2,a3
    1a5c:	b7e1                	j	1a24 <strnlen+0x8e>

0000000000001a5e <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a5e:	00b547b3          	xor	a5,a0,a1
    1a62:	8b9d                	andi	a5,a5,7
    1a64:	efa9                	bnez	a5,1abe <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a66:	0075f793          	andi	a5,a1,7
    1a6a:	c38d                	beqz	a5,1a8c <strcpy+0x2e>
            if (!(*d = *s))
    1a6c:	0005c783          	lbu	a5,0(a1)
    1a70:	00f50023          	sb	a5,0(a0)
    1a74:	e799                	bnez	a5,1a82 <strcpy+0x24>
    1a76:	a095                	j	1ada <strcpy+0x7c>
    1a78:	0005c783          	lbu	a5,0(a1)
    1a7c:	00f50023          	sb	a5,0(a0)
    1a80:	cbb9                	beqz	a5,1ad6 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a82:	0585                	addi	a1,a1,1
    1a84:	0075f793          	andi	a5,a1,7
    1a88:	0505                	addi	a0,a0,1
    1a8a:	f7fd                	bnez	a5,1a78 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a8c:	00000797          	auipc	a5,0x0
    1a90:	5f478793          	addi	a5,a5,1524 # 2080 <__clone+0xc6>
    1a94:	0007b803          	ld	a6,0(a5)
    1a98:	00000797          	auipc	a5,0x0
    1a9c:	5f078793          	addi	a5,a5,1520 # 2088 <__clone+0xce>
    1aa0:	6198                	ld	a4,0(a1)
    1aa2:	6390                	ld	a2,0(a5)
    1aa4:	a031                	j	1ab0 <strcpy+0x52>
    1aa6:	0521                	addi	a0,a0,8
    1aa8:	05a1                	addi	a1,a1,8
    1aaa:	fee53c23          	sd	a4,-8(a0)
    1aae:	6198                	ld	a4,0(a1)
    1ab0:	010707b3          	add	a5,a4,a6
    1ab4:	fff74693          	not	a3,a4
    1ab8:	8ff5                	and	a5,a5,a3
    1aba:	8ff1                	and	a5,a5,a2
    1abc:	d7ed                	beqz	a5,1aa6 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1abe:	0005c783          	lbu	a5,0(a1)
    1ac2:	00f50023          	sb	a5,0(a0)
    1ac6:	cb89                	beqz	a5,1ad8 <strcpy+0x7a>
    1ac8:	0585                	addi	a1,a1,1
    1aca:	0005c783          	lbu	a5,0(a1)
    1ace:	0505                	addi	a0,a0,1
    1ad0:	00f50023          	sb	a5,0(a0)
    1ad4:	fbf5                	bnez	a5,1ac8 <strcpy+0x6a>
        ;
    return d;
}
    1ad6:	8082                	ret
    1ad8:	8082                	ret
    1ada:	8082                	ret

0000000000001adc <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1adc:	00b547b3          	xor	a5,a0,a1
    1ae0:	8b9d                	andi	a5,a5,7
    1ae2:	ebc1                	bnez	a5,1b72 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ae4:	0075f793          	andi	a5,a1,7
    1ae8:	cf91                	beqz	a5,1b04 <strncpy+0x28>
    1aea:	20060e63          	beqz	a2,1d06 <strncpy+0x22a>
    1aee:	0005c783          	lbu	a5,0(a1)
    1af2:	00f50023          	sb	a5,0(a0)
    1af6:	c3d5                	beqz	a5,1b9a <strncpy+0xbe>
    1af8:	0585                	addi	a1,a1,1
    1afa:	0075f793          	andi	a5,a1,7
    1afe:	167d                	addi	a2,a2,-1
    1b00:	0505                	addi	a0,a0,1
    1b02:	f7e5                	bnez	a5,1aea <strncpy+0xe>
            ;
        if (!n || !*s)
    1b04:	20060163          	beqz	a2,1d06 <strncpy+0x22a>
    1b08:	0005c683          	lbu	a3,0(a1)
    1b0c:	c6d9                	beqz	a3,1b9a <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b0e:	479d                	li	a5,7
    1b10:	22c7f563          	bleu	a2,a5,1d3a <strncpy+0x25e>
    1b14:	00000317          	auipc	t1,0x0
    1b18:	56c30313          	addi	t1,t1,1388 # 2080 <__clone+0xc6>
    1b1c:	6198                	ld	a4,0(a1)
    1b1e:	00033783          	ld	a5,0(t1)
    1b22:	00000e17          	auipc	t3,0x0
    1b26:	566e0e13          	addi	t3,t3,1382 # 2088 <__clone+0xce>
    1b2a:	000e3803          	ld	a6,0(t3)
    1b2e:	97ba                	add	a5,a5,a4
    1b30:	fff74893          	not	a7,a4
    1b34:	0117f7b3          	and	a5,a5,a7
    1b38:	0107f7b3          	and	a5,a5,a6
    1b3c:	1e079f63          	bnez	a5,1d3a <strncpy+0x25e>
    1b40:	4e9d                	li	t4,7
    1b42:	a005                	j	1b62 <strncpy+0x86>
    1b44:	6598                	ld	a4,8(a1)
    1b46:	00033783          	ld	a5,0(t1)
    1b4a:	000e3803          	ld	a6,0(t3)
    1b4e:	fff74893          	not	a7,a4
    1b52:	97ba                	add	a5,a5,a4
    1b54:	0117f7b3          	and	a5,a5,a7
    1b58:	0107f7b3          	and	a5,a5,a6
    1b5c:	1a079f63          	bnez	a5,1d1a <strncpy+0x23e>
    1b60:	85b6                	mv	a1,a3
            *wd = *ws;
    1b62:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b64:	1661                	addi	a2,a2,-8
    1b66:	00858693          	addi	a3,a1,8
    1b6a:	0521                	addi	a0,a0,8
    1b6c:	fcceece3          	bltu	t4,a2,1b44 <strncpy+0x68>
    1b70:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b72:	18060a63          	beqz	a2,1d06 <strncpy+0x22a>
    1b76:	0005c783          	lbu	a5,0(a1)
    1b7a:	872a                	mv	a4,a0
    1b7c:	00f50023          	sb	a5,0(a0)
    1b80:	e799                	bnez	a5,1b8e <strncpy+0xb2>
    1b82:	a829                	j	1b9c <strncpy+0xc0>
    1b84:	0005c783          	lbu	a5,0(a1)
    1b88:	00f70023          	sb	a5,0(a4)
    1b8c:	cb81                	beqz	a5,1b9c <strncpy+0xc0>
    1b8e:	167d                	addi	a2,a2,-1
    1b90:	0585                	addi	a1,a1,1
    1b92:	0705                	addi	a4,a4,1
    1b94:	fa65                	bnez	a2,1b84 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b96:	853a                	mv	a0,a4
    1b98:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b9a:	872a                	mv	a4,a0
    1b9c:	4805                	li	a6,1
    1b9e:	14061c63          	bnez	a2,1cf6 <strncpy+0x21a>
    1ba2:	40e007b3          	neg	a5,a4
    1ba6:	8b9d                	andi	a5,a5,7
    1ba8:	4581                	li	a1,0
    1baa:	12061e63          	bnez	a2,1ce6 <strncpy+0x20a>
    1bae:	00778693          	addi	a3,a5,7
    1bb2:	452d                	li	a0,11
    1bb4:	12a6e763          	bltu	a3,a0,1ce2 <strncpy+0x206>
    1bb8:	16d5e663          	bltu	a1,a3,1d24 <strncpy+0x248>
    1bbc:	14078c63          	beqz	a5,1d14 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1bc0:	00070023          	sb	zero,0(a4)
    1bc4:	4585                	li	a1,1
    1bc6:	00170693          	addi	a3,a4,1
    1bca:	14b78363          	beq	a5,a1,1d10 <strncpy+0x234>
    1bce:	000700a3          	sb	zero,1(a4)
    1bd2:	4589                	li	a1,2
    1bd4:	00270693          	addi	a3,a4,2
    1bd8:	14b78963          	beq	a5,a1,1d2a <strncpy+0x24e>
    1bdc:	00070123          	sb	zero,2(a4)
    1be0:	458d                	li	a1,3
    1be2:	00370693          	addi	a3,a4,3
    1be6:	12b78363          	beq	a5,a1,1d0c <strncpy+0x230>
    1bea:	000701a3          	sb	zero,3(a4)
    1bee:	4591                	li	a1,4
    1bf0:	00470693          	addi	a3,a4,4
    1bf4:	12b78d63          	beq	a5,a1,1d2e <strncpy+0x252>
    1bf8:	00070223          	sb	zero,4(a4)
    1bfc:	4595                	li	a1,5
    1bfe:	00570693          	addi	a3,a4,5
    1c02:	12b78863          	beq	a5,a1,1d32 <strncpy+0x256>
    1c06:	000702a3          	sb	zero,5(a4)
    1c0a:	459d                	li	a1,7
    1c0c:	00670693          	addi	a3,a4,6
    1c10:	12b79363          	bne	a5,a1,1d36 <strncpy+0x25a>
    1c14:	00770693          	addi	a3,a4,7
    1c18:	00070323          	sb	zero,6(a4)
    1c1c:	40f80833          	sub	a6,a6,a5
    1c20:	ff887513          	andi	a0,a6,-8
    1c24:	97ba                	add	a5,a5,a4
    1c26:	953e                	add	a0,a0,a5
    1c28:	0007b023          	sd	zero,0(a5)
    1c2c:	07a1                	addi	a5,a5,8
    1c2e:	fea79de3          	bne	a5,a0,1c28 <strncpy+0x14c>
    1c32:	ff887513          	andi	a0,a6,-8
    1c36:	9da9                	addw	a1,a1,a0
    1c38:	00a687b3          	add	a5,a3,a0
    1c3c:	f4a80de3          	beq	a6,a0,1b96 <strncpy+0xba>
    1c40:	00078023          	sb	zero,0(a5)
    1c44:	0015869b          	addiw	a3,a1,1
    1c48:	f4c6f7e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c4c:	000780a3          	sb	zero,1(a5)
    1c50:	0025869b          	addiw	a3,a1,2
    1c54:	f4c6f1e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c58:	00078123          	sb	zero,2(a5)
    1c5c:	0035869b          	addiw	a3,a1,3
    1c60:	f2c6fbe3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c64:	000781a3          	sb	zero,3(a5)
    1c68:	0045869b          	addiw	a3,a1,4
    1c6c:	f2c6f5e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c70:	00078223          	sb	zero,4(a5)
    1c74:	0055869b          	addiw	a3,a1,5
    1c78:	f0c6ffe3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c7c:	000782a3          	sb	zero,5(a5)
    1c80:	0065869b          	addiw	a3,a1,6
    1c84:	f0c6f9e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c88:	00078323          	sb	zero,6(a5)
    1c8c:	0075869b          	addiw	a3,a1,7
    1c90:	f0c6f3e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1c94:	000783a3          	sb	zero,7(a5)
    1c98:	0085869b          	addiw	a3,a1,8
    1c9c:	eec6fde3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1ca0:	00078423          	sb	zero,8(a5)
    1ca4:	0095869b          	addiw	a3,a1,9
    1ca8:	eec6f7e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1cac:	000784a3          	sb	zero,9(a5)
    1cb0:	00a5869b          	addiw	a3,a1,10
    1cb4:	eec6f1e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1cb8:	00078523          	sb	zero,10(a5)
    1cbc:	00b5869b          	addiw	a3,a1,11
    1cc0:	ecc6fbe3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1cc4:	000785a3          	sb	zero,11(a5)
    1cc8:	00c5869b          	addiw	a3,a1,12
    1ccc:	ecc6f5e3          	bleu	a2,a3,1b96 <strncpy+0xba>
    1cd0:	00078623          	sb	zero,12(a5)
    1cd4:	25b5                	addiw	a1,a1,13
    1cd6:	ecc5f0e3          	bleu	a2,a1,1b96 <strncpy+0xba>
    1cda:	000786a3          	sb	zero,13(a5)
}
    1cde:	853a                	mv	a0,a4
    1ce0:	8082                	ret
    1ce2:	46ad                	li	a3,11
    1ce4:	bdd1                	j	1bb8 <strncpy+0xdc>
    1ce6:	00778693          	addi	a3,a5,7
    1cea:	452d                	li	a0,11
    1cec:	fff60593          	addi	a1,a2,-1
    1cf0:	eca6f4e3          	bleu	a0,a3,1bb8 <strncpy+0xdc>
    1cf4:	b7fd                	j	1ce2 <strncpy+0x206>
    1cf6:	40e007b3          	neg	a5,a4
    1cfa:	8832                	mv	a6,a2
    1cfc:	8b9d                	andi	a5,a5,7
    1cfe:	4581                	li	a1,0
    1d00:	ea0607e3          	beqz	a2,1bae <strncpy+0xd2>
    1d04:	b7cd                	j	1ce6 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1d06:	872a                	mv	a4,a0
}
    1d08:	853a                	mv	a0,a4
    1d0a:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d0c:	458d                	li	a1,3
    1d0e:	b739                	j	1c1c <strncpy+0x140>
    1d10:	4585                	li	a1,1
    1d12:	b729                	j	1c1c <strncpy+0x140>
    1d14:	86ba                	mv	a3,a4
    1d16:	4581                	li	a1,0
    1d18:	b711                	j	1c1c <strncpy+0x140>
    1d1a:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1d1e:	872a                	mv	a4,a0
    1d20:	85b6                	mv	a1,a3
    1d22:	bda9                	j	1b7c <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d24:	87ba                	mv	a5,a4
    1d26:	4581                	li	a1,0
    1d28:	bf21                	j	1c40 <strncpy+0x164>
    1d2a:	4589                	li	a1,2
    1d2c:	bdc5                	j	1c1c <strncpy+0x140>
    1d2e:	4591                	li	a1,4
    1d30:	b5f5                	j	1c1c <strncpy+0x140>
    1d32:	4595                	li	a1,5
    1d34:	b5e5                	j	1c1c <strncpy+0x140>
    1d36:	4599                	li	a1,6
    1d38:	b5d5                	j	1c1c <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d3a:	00d50023          	sb	a3,0(a0)
    1d3e:	872a                	mv	a4,a0
    1d40:	b5b9                	j	1b8e <strncpy+0xb2>

0000000000001d42 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d42:	87aa                	mv	a5,a0
    1d44:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d46:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d4a:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d4e:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d50:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d52:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d56:	2501                	sext.w	a0,a0
    1d58:	8082                	ret

0000000000001d5a <openat>:
    register long a7 __asm__("a7") = n;
    1d5a:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d5e:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d62:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d66:	2501                	sext.w	a0,a0
    1d68:	8082                	ret

0000000000001d6a <close>:
    register long a7 __asm__("a7") = n;
    1d6a:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d6e:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d72:	2501                	sext.w	a0,a0
    1d74:	8082                	ret

0000000000001d76 <read>:
    register long a7 __asm__("a7") = n;
    1d76:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7a:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d7e:	8082                	ret

0000000000001d80 <write>:
    register long a7 __asm__("a7") = n;
    1d80:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d84:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d88:	8082                	ret

0000000000001d8a <getpid>:
    register long a7 __asm__("a7") = n;
    1d8a:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d8e:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d92:	2501                	sext.w	a0,a0
    1d94:	8082                	ret

0000000000001d96 <getppid>:
    register long a7 __asm__("a7") = n;
    1d96:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d9a:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d9e:	2501                	sext.w	a0,a0
    1da0:	8082                	ret

0000000000001da2 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1da2:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1da6:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1daa:	2501                	sext.w	a0,a0
    1dac:	8082                	ret

0000000000001dae <fork>:
    register long a7 __asm__("a7") = n;
    1dae:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1db2:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1db4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1db6:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1dba:	2501                	sext.w	a0,a0
    1dbc:	8082                	ret

0000000000001dbe <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1dbe:	85b2                	mv	a1,a2
    1dc0:	863a                	mv	a2,a4
    if (stack)
    1dc2:	c191                	beqz	a1,1dc6 <clone+0x8>
	stack += stack_size;
    1dc4:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1dc6:	4781                	li	a5,0
    1dc8:	4701                	li	a4,0
    1dca:	4681                	li	a3,0
    1dcc:	2601                	sext.w	a2,a2
    1dce:	1ec0006f          	j	1fba <__clone>

0000000000001dd2 <exit>:
    register long a7 __asm__("a7") = n;
    1dd2:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1dd6:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1dda:	8082                	ret

0000000000001ddc <waitpid>:
    register long a7 __asm__("a7") = n;
    1ddc:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1de0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1de2:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1de6:	2501                	sext.w	a0,a0
    1de8:	8082                	ret

0000000000001dea <exec>:
    register long a7 __asm__("a7") = n;
    1dea:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dee:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1df2:	2501                	sext.w	a0,a0
    1df4:	8082                	ret

0000000000001df6 <execve>:
    register long a7 __asm__("a7") = n;
    1df6:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dfa:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1dfe:	2501                	sext.w	a0,a0
    1e00:	8082                	ret

0000000000001e02 <times>:
    register long a7 __asm__("a7") = n;
    1e02:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1e06:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1e0a:	2501                	sext.w	a0,a0
    1e0c:	8082                	ret

0000000000001e0e <get_time>:

int64 get_time()
{
    1e0e:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1e10:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1e14:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1e16:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e18:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1e1c:	2501                	sext.w	a0,a0
    1e1e:	ed09                	bnez	a0,1e38 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1e20:	67a2                	ld	a5,8(sp)
    1e22:	3e800713          	li	a4,1000
    1e26:	00015503          	lhu	a0,0(sp)
    1e2a:	02e7d7b3          	divu	a5,a5,a4
    1e2e:	02e50533          	mul	a0,a0,a4
    1e32:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e34:	0141                	addi	sp,sp,16
    1e36:	8082                	ret
        return -1;
    1e38:	557d                	li	a0,-1
    1e3a:	bfed                	j	1e34 <get_time+0x26>

0000000000001e3c <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e3c:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e40:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e44:	2501                	sext.w	a0,a0
    1e46:	8082                	ret

0000000000001e48 <time>:
    register long a7 __asm__("a7") = n;
    1e48:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e4c:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e50:	2501                	sext.w	a0,a0
    1e52:	8082                	ret

0000000000001e54 <sleep>:

int sleep(unsigned long long time)
{
    1e54:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e56:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e58:	850a                	mv	a0,sp
    1e5a:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e5c:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e60:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e62:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e66:	e501                	bnez	a0,1e6e <sleep+0x1a>
    return 0;
    1e68:	4501                	li	a0,0
}
    1e6a:	0141                	addi	sp,sp,16
    1e6c:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e6e:	4502                	lw	a0,0(sp)
}
    1e70:	0141                	addi	sp,sp,16
    1e72:	8082                	ret

0000000000001e74 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e74:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e78:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e7c:	2501                	sext.w	a0,a0
    1e7e:	8082                	ret

0000000000001e80 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e80:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e84:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e88:	8082                	ret

0000000000001e8a <munmap>:
    register long a7 __asm__("a7") = n;
    1e8a:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e8e:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e92:	2501                	sext.w	a0,a0
    1e94:	8082                	ret

0000000000001e96 <wait>:

int wait(int *code)
{
    1e96:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e98:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e9c:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e9e:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1ea0:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ea2:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1ea6:	2501                	sext.w	a0,a0
    1ea8:	8082                	ret

0000000000001eaa <spawn>:
    register long a7 __asm__("a7") = n;
    1eaa:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1eae:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1eb2:	2501                	sext.w	a0,a0
    1eb4:	8082                	ret

0000000000001eb6 <mailread>:
    register long a7 __asm__("a7") = n;
    1eb6:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eba:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1ebe:	2501                	sext.w	a0,a0
    1ec0:	8082                	ret

0000000000001ec2 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ec2:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ec6:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1eca:	2501                	sext.w	a0,a0
    1ecc:	8082                	ret

0000000000001ece <fstat>:
    register long a7 __asm__("a7") = n;
    1ece:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ed2:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1eda:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1edc:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ee0:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ee2:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ee6:	2501                	sext.w	a0,a0
    1ee8:	8082                	ret

0000000000001eea <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1eea:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eec:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ef0:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef2:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ef6:	2501                	sext.w	a0,a0
    1ef8:	8082                	ret

0000000000001efa <link>:

int link(char *old_path, char *new_path)
{
    1efa:	87aa                	mv	a5,a0
    1efc:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1efe:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1f02:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f06:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1f08:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1f0c:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f0e:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1f12:	2501                	sext.w	a0,a0
    1f14:	8082                	ret

0000000000001f16 <unlink>:

int unlink(char *path)
{
    1f16:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1f18:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1f1c:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1f20:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f22:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f26:	2501                	sext.w	a0,a0
    1f28:	8082                	ret

0000000000001f2a <uname>:
    register long a7 __asm__("a7") = n;
    1f2a:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f2e:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f32:	2501                	sext.w	a0,a0
    1f34:	8082                	ret

0000000000001f36 <brk>:
    register long a7 __asm__("a7") = n;
    1f36:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f3a:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f3e:	2501                	sext.w	a0,a0
    1f40:	8082                	ret

0000000000001f42 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f42:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f44:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f48:	8082                	ret

0000000000001f4a <chdir>:
    register long a7 __asm__("a7") = n;
    1f4a:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f4e:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f52:	2501                	sext.w	a0,a0
    1f54:	8082                	ret

0000000000001f56 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f56:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f58:	02059613          	slli	a2,a1,0x20
    1f5c:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f5e:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f62:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f66:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f68:	00000073          	ecall
}
    1f6c:	2501                	sext.w	a0,a0
    1f6e:	8082                	ret

0000000000001f70 <getdents>:
    register long a7 __asm__("a7") = n;
    1f70:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f74:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f78:	2501                	sext.w	a0,a0
    1f7a:	8082                	ret

0000000000001f7c <pipe>:
    register long a7 __asm__("a7") = n;
    1f7c:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f80:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f82:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f86:	2501                	sext.w	a0,a0
    1f88:	8082                	ret

0000000000001f8a <dup>:
    register long a7 __asm__("a7") = n;
    1f8a:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f8c:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f90:	2501                	sext.w	a0,a0
    1f92:	8082                	ret

0000000000001f94 <dup2>:
    register long a7 __asm__("a7") = n;
    1f94:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f96:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f98:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f9c:	2501                	sext.w	a0,a0
    1f9e:	8082                	ret

0000000000001fa0 <mount>:
    register long a7 __asm__("a7") = n;
    1fa0:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1fa4:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1fa8:	2501                	sext.w	a0,a0
    1faa:	8082                	ret

0000000000001fac <umount>:
    register long a7 __asm__("a7") = n;
    1fac:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1fb0:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1fb2:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1fb6:	2501                	sext.w	a0,a0
    1fb8:	8082                	ret

0000000000001fba <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1fba:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1fbc:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1fbe:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1fc0:	8532                	mv	a0,a2
	mv a2, a4
    1fc2:	863a                	mv	a2,a4
	mv a3, a5
    1fc4:	86be                	mv	a3,a5
	mv a4, a6
    1fc6:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fc8:	0dc00893          	li	a7,220
	ecall
    1fcc:	00000073          	ecall

	beqz a0, 1f
    1fd0:	c111                	beqz	a0,1fd4 <__clone+0x1a>
	# Parent
	ret
    1fd2:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fd4:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fd6:	6522                	ld	a0,8(sp)
	jalr a1
    1fd8:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fda:	05d00893          	li	a7,93
	ecall
    1fde:	00000073          	ecall
