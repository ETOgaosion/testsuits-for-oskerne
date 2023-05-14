
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/getcwd:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	09a0006f          	j	109c <__start_main>

0000000000001006 <test_getcwd>:
 * 测试通过时输出：
 * "getcwd OK."
 * 测试失败时输出：
 * "getcwd ERROR."
 */
void test_getcwd(void){
    1006:	7175                	addi	sp,sp,-144
   TEST_START(__func__);
    1008:	00001517          	auipc	a0,0x1
    100c:	fb850513          	addi	a0,a0,-72 # 1fc0 <__clone+0x28>
void test_getcwd(void){
    1010:	e506                	sd	ra,136(sp)
   TEST_START(__func__);
    1012:	28a000ef          	jal	ra,129c <puts>
    1016:	00001517          	auipc	a0,0x1
    101a:	03250513          	addi	a0,a0,50 # 2048 <__func__.1212>
    101e:	27e000ef          	jal	ra,129c <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	fb650513          	addi	a0,a0,-74 # 1fd8 <__clone+0x40>
    102a:	272000ef          	jal	ra,129c <puts>
    char *cwd = NULL;
    char buf[128] = {0};
    102e:	4581                	li	a1,0
    1030:	08000613          	li	a2,128
    1034:	850a                	mv	a0,sp
    1036:	5f2000ef          	jal	ra,1628 <memset>
    cwd = getcwd(buf, 128);
    103a:	08000593          	li	a1,128
    103e:	850a                	mv	a0,sp
    1040:	6e1000ef          	jal	ra,1f20 <getcwd>
    if(cwd != NULL) printf("getcwd: %s successfully!\n", buf);
    1044:	cd0d                	beqz	a0,107e <test_getcwd+0x78>
    1046:	858a                	mv	a1,sp
    1048:	00001517          	auipc	a0,0x1
    104c:	fa050513          	addi	a0,a0,-96 # 1fe8 <__clone+0x50>
    1050:	26e000ef          	jal	ra,12be <printf>
    else printf("getcwd ERROR.\n");
   TEST_END(__func__);
    1054:	00001517          	auipc	a0,0x1
    1058:	fc450513          	addi	a0,a0,-60 # 2018 <__clone+0x80>
    105c:	240000ef          	jal	ra,129c <puts>
    1060:	00001517          	auipc	a0,0x1
    1064:	fe850513          	addi	a0,a0,-24 # 2048 <__func__.1212>
    1068:	234000ef          	jal	ra,129c <puts>
    106c:	00001517          	auipc	a0,0x1
    1070:	f6c50513          	addi	a0,a0,-148 # 1fd8 <__clone+0x40>
    1074:	228000ef          	jal	ra,129c <puts>
}
    1078:	60aa                	ld	ra,136(sp)
    107a:	6149                	addi	sp,sp,144
    107c:	8082                	ret
    else printf("getcwd ERROR.\n");
    107e:	00001517          	auipc	a0,0x1
    1082:	f8a50513          	addi	a0,a0,-118 # 2008 <__clone+0x70>
    1086:	238000ef          	jal	ra,12be <printf>
    108a:	b7e9                	j	1054 <test_getcwd+0x4e>

000000000000108c <main>:

int main(void){
    108c:	1141                	addi	sp,sp,-16
    108e:	e406                	sd	ra,8(sp)
    test_getcwd();
    1090:	f77ff0ef          	jal	ra,1006 <test_getcwd>
    return 0;
}
    1094:	60a2                	ld	ra,8(sp)
    1096:	4501                	li	a0,0
    1098:	0141                	addi	sp,sp,16
    109a:	8082                	ret

000000000000109c <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    109c:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    109e:	4108                	lw	a0,0(a0)
{
    10a0:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    10a2:	05a1                	addi	a1,a1,8
{
    10a4:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    10a6:	fe7ff0ef          	jal	ra,108c <main>
    10aa:	507000ef          	jal	ra,1db0 <exit>
	return 0;
}
    10ae:	60a2                	ld	ra,8(sp)
    10b0:	4501                	li	a0,0
    10b2:	0141                	addi	sp,sp,16
    10b4:	8082                	ret

00000000000010b6 <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    10b6:	7179                	addi	sp,sp,-48
    10b8:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    10ba:	12054e63          	bltz	a0,11f6 <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    10be:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    10c2:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    10c4:	02b7f6bb          	remuw	a3,a5,a1
    10c8:	00001717          	auipc	a4,0x1
    10cc:	f9070713          	addi	a4,a4,-112 # 2058 <digits>
    buf[16] = 0;
    10d0:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    10d4:	1682                	slli	a3,a3,0x20
    10d6:	9281                	srli	a3,a3,0x20
    10d8:	96ba                	add	a3,a3,a4
    10da:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    10de:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    10e2:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    10e6:	16b7e363          	bltu	a5,a1,124c <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    10ea:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    10ee:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    10f2:	1602                	slli	a2,a2,0x20
    10f4:	9201                	srli	a2,a2,0x20
    10f6:	963a                	add	a2,a2,a4
    10f8:	00064603          	lbu	a2,0(a2)
    10fc:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    1100:	0007861b          	sext.w	a2,a5
    1104:	12b6e863          	bltu	a3,a1,1234 <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    1108:	02b7f6bb          	remuw	a3,a5,a1
    110c:	1682                	slli	a3,a3,0x20
    110e:	9281                	srli	a3,a3,0x20
    1110:	96ba                	add	a3,a3,a4
    1112:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1116:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    111a:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    111e:	10b66e63          	bltu	a2,a1,123a <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    1122:	02b876bb          	remuw	a3,a6,a1
    1126:	1682                	slli	a3,a3,0x20
    1128:	9281                	srli	a3,a3,0x20
    112a:	96ba                	add	a3,a3,a4
    112c:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1130:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1134:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    1138:	10b86463          	bltu	a6,a1,1240 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    113c:	02b676bb          	remuw	a3,a2,a1
    1140:	1682                	slli	a3,a3,0x20
    1142:	9281                	srli	a3,a3,0x20
    1144:	96ba                	add	a3,a3,a4
    1146:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    114a:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    114e:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    1152:	0eb66a63          	bltu	a2,a1,1246 <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    1156:	02b876bb          	remuw	a3,a6,a1
    115a:	1682                	slli	a3,a3,0x20
    115c:	9281                	srli	a3,a3,0x20
    115e:	96ba                	add	a3,a3,a4
    1160:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1164:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1168:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    116c:	0cb86163          	bltu	a6,a1,122e <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1170:	02b676bb          	remuw	a3,a2,a1
    1174:	1682                	slli	a3,a3,0x20
    1176:	9281                	srli	a3,a3,0x20
    1178:	96ba                	add	a3,a3,a4
    117a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    117e:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1182:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    1186:	0cb66563          	bltu	a2,a1,1250 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    118a:	02b876bb          	remuw	a3,a6,a1
    118e:	1682                	slli	a3,a3,0x20
    1190:	9281                	srli	a3,a3,0x20
    1192:	96ba                	add	a3,a3,a4
    1194:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1198:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    119c:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    11a0:	0ab86b63          	bltu	a6,a1,1256 <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    11a4:	02b676bb          	remuw	a3,a2,a1
    11a8:	1682                	slli	a3,a3,0x20
    11aa:	9281                	srli	a3,a3,0x20
    11ac:	96ba                	add	a3,a3,a4
    11ae:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    11b2:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    11b6:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    11ba:	0ab66163          	bltu	a2,a1,125c <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    11be:	1782                	slli	a5,a5,0x20
    11c0:	9381                	srli	a5,a5,0x20
    11c2:	97ba                	add	a5,a5,a4
    11c4:	0007c703          	lbu	a4,0(a5)
    11c8:	4599                	li	a1,6
    11ca:	4795                	li	a5,5
    11cc:	00e10723          	sb	a4,14(sp)

    if (sign)
    11d0:	00055963          	bgez	a0,11e2 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    11d4:	1018                	addi	a4,sp,32
    11d6:	973e                	add	a4,a4,a5
    11d8:	02d00693          	li	a3,45
    11dc:	fed70423          	sb	a3,-24(a4)
    11e0:	85be                	mv	a1,a5
    write(f, s, l);
    11e2:	003c                	addi	a5,sp,8
    11e4:	4641                	li	a2,16
    11e6:	9e0d                	subw	a2,a2,a1
    11e8:	4505                	li	a0,1
    11ea:	95be                	add	a1,a1,a5
    11ec:	373000ef          	jal	ra,1d5e <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    11f0:	70a2                	ld	ra,40(sp)
    11f2:	6145                	addi	sp,sp,48
    11f4:	8082                	ret
        x = -xx;
    11f6:	40a0063b          	negw	a2,a0
    11fa:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11fc:	02b677bb          	remuw	a5,a2,a1
    1200:	00001717          	auipc	a4,0x1
    1204:	e5870713          	addi	a4,a4,-424 # 2058 <digits>
    buf[16] = 0;
    1208:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    120c:	1782                	slli	a5,a5,0x20
    120e:	9381                	srli	a5,a5,0x20
    1210:	97ba                	add	a5,a5,a4
    1212:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    1216:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    121a:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    121e:	ecb676e3          	bleu	a1,a2,10ea <printint.constprop.0+0x34>
        buf[i--] = '-';
    1222:	02d00793          	li	a5,45
    1226:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    122a:	45b9                	li	a1,14
    122c:	bf5d                	j	11e2 <printint.constprop.0+0x12c>
    122e:	47a5                	li	a5,9
    1230:	45a9                	li	a1,10
    1232:	bf79                	j	11d0 <printint.constprop.0+0x11a>
    1234:	47b5                	li	a5,13
    1236:	45b9                	li	a1,14
    1238:	bf61                	j	11d0 <printint.constprop.0+0x11a>
    123a:	47b1                	li	a5,12
    123c:	45b5                	li	a1,13
    123e:	bf49                	j	11d0 <printint.constprop.0+0x11a>
    1240:	47ad                	li	a5,11
    1242:	45b1                	li	a1,12
    1244:	b771                	j	11d0 <printint.constprop.0+0x11a>
    1246:	47a9                	li	a5,10
    1248:	45ad                	li	a1,11
    124a:	b759                	j	11d0 <printint.constprop.0+0x11a>
    i = 15;
    124c:	45bd                	li	a1,15
    124e:	bf51                	j	11e2 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    1250:	47a1                	li	a5,8
    1252:	45a5                	li	a1,9
    1254:	bfb5                	j	11d0 <printint.constprop.0+0x11a>
    1256:	479d                	li	a5,7
    1258:	45a1                	li	a1,8
    125a:	bf9d                	j	11d0 <printint.constprop.0+0x11a>
    125c:	4799                	li	a5,6
    125e:	459d                	li	a1,7
    1260:	bf85                	j	11d0 <printint.constprop.0+0x11a>

0000000000001262 <getchar>:
{
    1262:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    1264:	00f10593          	addi	a1,sp,15
    1268:	4605                	li	a2,1
    126a:	4501                	li	a0,0
{
    126c:	ec06                	sd	ra,24(sp)
    char byte = 0;
    126e:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1272:	2e3000ef          	jal	ra,1d54 <read>
}
    1276:	60e2                	ld	ra,24(sp)
    1278:	00f14503          	lbu	a0,15(sp)
    127c:	6105                	addi	sp,sp,32
    127e:	8082                	ret

0000000000001280 <putchar>:
{
    1280:	1101                	addi	sp,sp,-32
    char byte = c;
    1282:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    1286:	00f10593          	addi	a1,sp,15
    128a:	4605                	li	a2,1
    128c:	4505                	li	a0,1
{
    128e:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1290:	2cf000ef          	jal	ra,1d5e <write>
}
    1294:	60e2                	ld	ra,24(sp)
    1296:	2501                	sext.w	a0,a0
    1298:	6105                	addi	sp,sp,32
    129a:	8082                	ret

000000000000129c <puts>:
{
    129c:	1141                	addi	sp,sp,-16
    129e:	e406                	sd	ra,8(sp)
    12a0:	e022                	sd	s0,0(sp)
    12a2:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    12a4:	59e000ef          	jal	ra,1842 <strlen>
    12a8:	862a                	mv	a2,a0
    12aa:	85a2                	mv	a1,s0
    12ac:	4505                	li	a0,1
    12ae:	2b1000ef          	jal	ra,1d5e <write>
}
    12b2:	60a2                	ld	ra,8(sp)
    12b4:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    12b6:	957d                	srai	a0,a0,0x3f
    return r;
    12b8:	2501                	sext.w	a0,a0
}
    12ba:	0141                	addi	sp,sp,16
    12bc:	8082                	ret

00000000000012be <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    12be:	7131                	addi	sp,sp,-192
    12c0:	e0da                	sd	s6,64(sp)
    12c2:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    12c4:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    12c6:	013c                	addi	a5,sp,136
{
    12c8:	f0ca                	sd	s2,96(sp)
    12ca:	ecce                	sd	s3,88(sp)
    12cc:	e8d2                	sd	s4,80(sp)
    12ce:	e4d6                	sd	s5,72(sp)
    12d0:	fc5e                	sd	s7,56(sp)
    12d2:	fc86                	sd	ra,120(sp)
    12d4:	f8a2                	sd	s0,112(sp)
    12d6:	f4a6                	sd	s1,104(sp)
    12d8:	89aa                	mv	s3,a0
    12da:	e52e                	sd	a1,136(sp)
    12dc:	e932                	sd	a2,144(sp)
    12de:	ed36                	sd	a3,152(sp)
    12e0:	f13a                	sd	a4,160(sp)
    12e2:	f942                	sd	a6,176(sp)
    12e4:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    12e6:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    12e8:	02500913          	li	s2,37
    12ec:	07000a93          	li	s5,112
    buf[i++] = '0';
    12f0:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    12f4:	00001a17          	auipc	s4,0x1
    12f8:	d64a0a13          	addi	s4,s4,-668 # 2058 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12fc:	00001b97          	auipc	s7,0x1
    1300:	d2cb8b93          	addi	s7,s7,-724 # 2028 <__clone+0x90>
        if (!*s)
    1304:	0009c783          	lbu	a5,0(s3)
    1308:	cfb9                	beqz	a5,1366 <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    130a:	23278d63          	beq	a5,s2,1544 <printf+0x286>
    130e:	864e                	mv	a2,s3
    1310:	a019                	j	1316 <printf+0x58>
    1312:	07278563          	beq	a5,s2,137c <printf+0xbe>
    1316:	0605                	addi	a2,a2,1
    1318:	00064783          	lbu	a5,0(a2)
    131c:	fbfd                	bnez	a5,1312 <printf+0x54>
    131e:	84b2                	mv	s1,a2
        l = z - a;
    1320:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1324:	8622                	mv	a2,s0
    1326:	85ce                	mv	a1,s3
    1328:	4505                	li	a0,1
    132a:	235000ef          	jal	ra,1d5e <write>
        if (l)
    132e:	ec3d                	bnez	s0,13ac <printf+0xee>
        if (s[1] == 0)
    1330:	0014c783          	lbu	a5,1(s1)
    1334:	cb8d                	beqz	a5,1366 <printf+0xa8>
        switch (s[1])
    1336:	09578b63          	beq	a5,s5,13cc <printf+0x10e>
    133a:	06fafb63          	bleu	a5,s5,13b0 <printf+0xf2>
    133e:	07300713          	li	a4,115
    1342:	1ce78e63          	beq	a5,a4,151e <printf+0x260>
    1346:	07800713          	li	a4,120
    134a:	1ae79563          	bne	a5,a4,14f4 <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    134e:	6782                	ld	a5,0(sp)
    1350:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    1352:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    1356:	4388                	lw	a0,0(a5)
    1358:	07a1                	addi	a5,a5,8
    135a:	e03e                	sd	a5,0(sp)
    135c:	d5bff0ef          	jal	ra,10b6 <printint.constprop.0>
        if (!*s)
    1360:	0009c783          	lbu	a5,0(s3)
    1364:	f3dd                	bnez	a5,130a <printf+0x4c>
    }
    va_end(ap);
}
    1366:	70e6                	ld	ra,120(sp)
    1368:	7446                	ld	s0,112(sp)
    136a:	74a6                	ld	s1,104(sp)
    136c:	7906                	ld	s2,96(sp)
    136e:	69e6                	ld	s3,88(sp)
    1370:	6a46                	ld	s4,80(sp)
    1372:	6aa6                	ld	s5,72(sp)
    1374:	6b06                	ld	s6,64(sp)
    1376:	7be2                	ld	s7,56(sp)
    1378:	6129                	addi	sp,sp,192
    137a:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    137c:	00164783          	lbu	a5,1(a2)
    1380:	84b2                	mv	s1,a2
    1382:	01278763          	beq	a5,s2,1390 <printf+0xd2>
    1386:	bf69                	j	1320 <printf+0x62>
    1388:	0014c783          	lbu	a5,1(s1)
    138c:	f9279ae3          	bne	a5,s2,1320 <printf+0x62>
    1390:	0489                	addi	s1,s1,2
    1392:	0004c783          	lbu	a5,0(s1)
    1396:	0605                	addi	a2,a2,1
    1398:	ff2788e3          	beq	a5,s2,1388 <printf+0xca>
        l = z - a;
    139c:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    13a0:	8622                	mv	a2,s0
    13a2:	85ce                	mv	a1,s3
    13a4:	4505                	li	a0,1
    13a6:	1b9000ef          	jal	ra,1d5e <write>
        if (l)
    13aa:	d059                	beqz	s0,1330 <printf+0x72>
    13ac:	89a6                	mv	s3,s1
    13ae:	bf99                	j	1304 <printf+0x46>
    13b0:	06400713          	li	a4,100
    13b4:	14e79063          	bne	a5,a4,14f4 <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    13b8:	6782                	ld	a5,0(sp)
    13ba:	45a9                	li	a1,10
        s += 2;
    13bc:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    13c0:	4388                	lw	a0,0(a5)
    13c2:	07a1                	addi	a5,a5,8
    13c4:	e03e                	sd	a5,0(sp)
    13c6:	cf1ff0ef          	jal	ra,10b6 <printint.constprop.0>
        s += 2;
    13ca:	bf59                	j	1360 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    13cc:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    13ce:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    13d2:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    13d4:	631c                	ld	a5,0(a4)
    13d6:	0721                	addi	a4,a4,8
    13d8:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    13da:	00479293          	slli	t0,a5,0x4
    13de:	00879f93          	slli	t6,a5,0x8
    13e2:	00c79f13          	slli	t5,a5,0xc
    13e6:	01079e93          	slli	t4,a5,0x10
    13ea:	01479e13          	slli	t3,a5,0x14
    13ee:	01879313          	slli	t1,a5,0x18
    13f2:	01c79893          	slli	a7,a5,0x1c
    13f6:	02479813          	slli	a6,a5,0x24
    13fa:	02879513          	slli	a0,a5,0x28
    13fe:	02c79593          	slli	a1,a5,0x2c
    1402:	03079693          	slli	a3,a5,0x30
    1406:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    140a:	03c7d413          	srli	s0,a5,0x3c
    140e:	01c7d39b          	srliw	t2,a5,0x1c
    1412:	03c2d293          	srli	t0,t0,0x3c
    1416:	03cfdf93          	srli	t6,t6,0x3c
    141a:	03cf5f13          	srli	t5,t5,0x3c
    141e:	03cede93          	srli	t4,t4,0x3c
    1422:	03ce5e13          	srli	t3,t3,0x3c
    1426:	03c35313          	srli	t1,t1,0x3c
    142a:	03c8d893          	srli	a7,a7,0x3c
    142e:	03c85813          	srli	a6,a6,0x3c
    1432:	9171                	srli	a0,a0,0x3c
    1434:	91f1                	srli	a1,a1,0x3c
    1436:	92f1                	srli	a3,a3,0x3c
    1438:	9371                	srli	a4,a4,0x3c
    143a:	96d2                	add	a3,a3,s4
    143c:	9752                	add	a4,a4,s4
    143e:	9452                	add	s0,s0,s4
    1440:	92d2                	add	t0,t0,s4
    1442:	9fd2                	add	t6,t6,s4
    1444:	9f52                	add	t5,t5,s4
    1446:	9ed2                	add	t4,t4,s4
    1448:	9e52                	add	t3,t3,s4
    144a:	9352                	add	t1,t1,s4
    144c:	98d2                	add	a7,a7,s4
    144e:	93d2                	add	t2,t2,s4
    1450:	9852                	add	a6,a6,s4
    1452:	9552                	add	a0,a0,s4
    1454:	95d2                	add	a1,a1,s4
    1456:	0006c983          	lbu	s3,0(a3)
    145a:	0002c283          	lbu	t0,0(t0)
    145e:	00074683          	lbu	a3,0(a4)
    1462:	000fcf83          	lbu	t6,0(t6)
    1466:	000f4f03          	lbu	t5,0(t5)
    146a:	000ece83          	lbu	t4,0(t4)
    146e:	000e4e03          	lbu	t3,0(t3)
    1472:	00034303          	lbu	t1,0(t1)
    1476:	0008c883          	lbu	a7,0(a7)
    147a:	0003c383          	lbu	t2,0(t2)
    147e:	00084803          	lbu	a6,0(a6)
    1482:	00054503          	lbu	a0,0(a0)
    1486:	0005c583          	lbu	a1,0(a1)
    148a:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    148e:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1492:	9371                	srli	a4,a4,0x3c
    1494:	8bbd                	andi	a5,a5,15
    1496:	9752                	add	a4,a4,s4
    1498:	97d2                	add	a5,a5,s4
    149a:	005105a3          	sb	t0,11(sp)
    149e:	01f10623          	sb	t6,12(sp)
    14a2:	01e106a3          	sb	t5,13(sp)
    14a6:	01d10723          	sb	t4,14(sp)
    14aa:	01c107a3          	sb	t3,15(sp)
    14ae:	00610823          	sb	t1,16(sp)
    14b2:	011108a3          	sb	a7,17(sp)
    14b6:	00710923          	sb	t2,18(sp)
    14ba:	010109a3          	sb	a6,19(sp)
    14be:	00a10a23          	sb	a0,20(sp)
    14c2:	00b10aa3          	sb	a1,21(sp)
    14c6:	01310b23          	sb	s3,22(sp)
    14ca:	00d10ba3          	sb	a3,23(sp)
    14ce:	00810523          	sb	s0,10(sp)
    14d2:	00074703          	lbu	a4,0(a4)
    14d6:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    14da:	002c                	addi	a1,sp,8
    14dc:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    14de:	00e10c23          	sb	a4,24(sp)
    14e2:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    14e6:	00010d23          	sb	zero,26(sp)
        s += 2;
    14ea:	00248993          	addi	s3,s1,2
    write(f, s, l);
    14ee:	071000ef          	jal	ra,1d5e <write>
        s += 2;
    14f2:	b5bd                	j	1360 <printf+0xa2>
    char byte = c;
    14f4:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    14f8:	4605                	li	a2,1
    14fa:	002c                	addi	a1,sp,8
    14fc:	4505                	li	a0,1
    char byte = c;
    14fe:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    1502:	05d000ef          	jal	ra,1d5e <write>
    char byte = c;
    1506:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    150a:	4605                	li	a2,1
    150c:	002c                	addi	a1,sp,8
    150e:	4505                	li	a0,1
    char byte = c;
    1510:	00f10423          	sb	a5,8(sp)
        s += 2;
    1514:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    1518:	047000ef          	jal	ra,1d5e <write>
        s += 2;
    151c:	b591                	j	1360 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    151e:	6782                	ld	a5,0(sp)
    1520:	6380                	ld	s0,0(a5)
    1522:	07a1                	addi	a5,a5,8
    1524:	e03e                	sd	a5,0(sp)
    1526:	cc05                	beqz	s0,155e <printf+0x2a0>
            l = strnlen(a, 200);
    1528:	0c800593          	li	a1,200
    152c:	8522                	mv	a0,s0
    152e:	446000ef          	jal	ra,1974 <strnlen>
    write(f, s, l);
    1532:	0005061b          	sext.w	a2,a0
    1536:	85a2                	mv	a1,s0
    1538:	4505                	li	a0,1
    153a:	025000ef          	jal	ra,1d5e <write>
        s += 2;
    153e:	00248993          	addi	s3,s1,2
    1542:	bd39                	j	1360 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1544:	0019c783          	lbu	a5,1(s3)
    1548:	84ce                	mv	s1,s3
    154a:	864e                	mv	a2,s3
    154c:	e52782e3          	beq	a5,s2,1390 <printf+0xd2>
    write(f, s, l);
    1550:	4601                	li	a2,0
    1552:	85ce                	mv	a1,s3
    1554:	4505                	li	a0,1
    1556:	009000ef          	jal	ra,1d5e <write>
    155a:	84ce                	mv	s1,s3
    155c:	bbd1                	j	1330 <printf+0x72>
                a = "(null)";
    155e:	845e                	mv	s0,s7
    1560:	b7e1                	j	1528 <printf+0x26a>

0000000000001562 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1562:	02000793          	li	a5,32
    1566:	00f50663          	beq	a0,a5,1572 <isspace+0x10>
    156a:	355d                	addiw	a0,a0,-9
    156c:	00553513          	sltiu	a0,a0,5
    1570:	8082                	ret
    1572:	4505                	li	a0,1
}
    1574:	8082                	ret

0000000000001576 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    1576:	fd05051b          	addiw	a0,a0,-48
}
    157a:	00a53513          	sltiu	a0,a0,10
    157e:	8082                	ret

0000000000001580 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1580:	02000613          	li	a2,32
    1584:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    1586:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    158a:	0007079b          	sext.w	a5,a4
    158e:	ff77869b          	addiw	a3,a5,-9
    1592:	04c70b63          	beq	a4,a2,15e8 <atoi+0x68>
    1596:	04d5f963          	bleu	a3,a1,15e8 <atoi+0x68>
        s++;
    switch (*s)
    159a:	02b00693          	li	a3,43
    159e:	04d70a63          	beq	a4,a3,15f2 <atoi+0x72>
    15a2:	02d00693          	li	a3,45
    15a6:	06d70463          	beq	a4,a3,160e <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    15aa:	fd07859b          	addiw	a1,a5,-48
    15ae:	4625                	li	a2,9
    15b0:	873e                	mv	a4,a5
    15b2:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    15b4:	4e01                	li	t3,0
    while (isdigit(*s))
    15b6:	04b66a63          	bltu	a2,a1,160a <atoi+0x8a>
    int n = 0, neg = 0;
    15ba:	4501                	li	a0,0
    while (isdigit(*s))
    15bc:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    15be:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    15c0:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    15c4:	0025179b          	slliw	a5,a0,0x2
    15c8:	9d3d                	addw	a0,a0,a5
    15ca:	fd07031b          	addiw	t1,a4,-48
    15ce:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    15d2:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    15d6:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    15da:	0006071b          	sext.w	a4,a2
    15de:	feb870e3          	bleu	a1,a6,15be <atoi+0x3e>
    return neg ? n : -n;
    15e2:	000e0563          	beqz	t3,15ec <atoi+0x6c>
}
    15e6:	8082                	ret
        s++;
    15e8:	0505                	addi	a0,a0,1
    15ea:	bf71                	j	1586 <atoi+0x6>
    15ec:	4113053b          	subw	a0,t1,a7
    15f0:	8082                	ret
    while (isdigit(*s))
    15f2:	00154783          	lbu	a5,1(a0)
    15f6:	4625                	li	a2,9
        s++;
    15f8:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15fc:	fd07859b          	addiw	a1,a5,-48
    1600:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    1604:	4e01                	li	t3,0
    while (isdigit(*s))
    1606:	fab67ae3          	bleu	a1,a2,15ba <atoi+0x3a>
    160a:	4501                	li	a0,0
}
    160c:	8082                	ret
    while (isdigit(*s))
    160e:	00154783          	lbu	a5,1(a0)
    1612:	4625                	li	a2,9
        s++;
    1614:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    1618:	fd07859b          	addiw	a1,a5,-48
    161c:	0007871b          	sext.w	a4,a5
    1620:	feb665e3          	bltu	a2,a1,160a <atoi+0x8a>
        neg = 1;
    1624:	4e05                	li	t3,1
    1626:	bf51                	j	15ba <atoi+0x3a>

0000000000001628 <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    1628:	16060d63          	beqz	a2,17a2 <memset+0x17a>
    162c:	40a007b3          	neg	a5,a0
    1630:	8b9d                	andi	a5,a5,7
    1632:	00778713          	addi	a4,a5,7
    1636:	482d                	li	a6,11
    1638:	0ff5f593          	andi	a1,a1,255
    163c:	fff60693          	addi	a3,a2,-1
    1640:	17076263          	bltu	a4,a6,17a4 <memset+0x17c>
    1644:	16e6ea63          	bltu	a3,a4,17b8 <memset+0x190>
    1648:	16078563          	beqz	a5,17b2 <memset+0x18a>
    164c:	00b50023          	sb	a1,0(a0)
    1650:	4705                	li	a4,1
    1652:	00150e93          	addi	t4,a0,1
    1656:	14e78c63          	beq	a5,a4,17ae <memset+0x186>
    165a:	00b500a3          	sb	a1,1(a0)
    165e:	4709                	li	a4,2
    1660:	00250e93          	addi	t4,a0,2
    1664:	14e78d63          	beq	a5,a4,17be <memset+0x196>
    1668:	00b50123          	sb	a1,2(a0)
    166c:	470d                	li	a4,3
    166e:	00350e93          	addi	t4,a0,3
    1672:	12e78b63          	beq	a5,a4,17a8 <memset+0x180>
    1676:	00b501a3          	sb	a1,3(a0)
    167a:	4711                	li	a4,4
    167c:	00450e93          	addi	t4,a0,4
    1680:	14e78163          	beq	a5,a4,17c2 <memset+0x19a>
    1684:	00b50223          	sb	a1,4(a0)
    1688:	4715                	li	a4,5
    168a:	00550e93          	addi	t4,a0,5
    168e:	12e78c63          	beq	a5,a4,17c6 <memset+0x19e>
    1692:	00b502a3          	sb	a1,5(a0)
    1696:	471d                	li	a4,7
    1698:	00650e93          	addi	t4,a0,6
    169c:	12e79763          	bne	a5,a4,17ca <memset+0x1a2>
    16a0:	00750e93          	addi	t4,a0,7
    16a4:	00b50323          	sb	a1,6(a0)
    16a8:	4f1d                	li	t5,7
    16aa:	00859713          	slli	a4,a1,0x8
    16ae:	8f4d                	or	a4,a4,a1
    16b0:	01059e13          	slli	t3,a1,0x10
    16b4:	01c76e33          	or	t3,a4,t3
    16b8:	01859313          	slli	t1,a1,0x18
    16bc:	006e6333          	or	t1,t3,t1
    16c0:	02059893          	slli	a7,a1,0x20
    16c4:	011368b3          	or	a7,t1,a7
    16c8:	02859813          	slli	a6,a1,0x28
    16cc:	40f60333          	sub	t1,a2,a5
    16d0:	0108e833          	or	a6,a7,a6
    16d4:	03059693          	slli	a3,a1,0x30
    16d8:	00d866b3          	or	a3,a6,a3
    16dc:	03859713          	slli	a4,a1,0x38
    16e0:	97aa                	add	a5,a5,a0
    16e2:	ff837813          	andi	a6,t1,-8
    16e6:	8f55                	or	a4,a4,a3
    16e8:	00f806b3          	add	a3,a6,a5
    16ec:	e398                	sd	a4,0(a5)
    16ee:	07a1                	addi	a5,a5,8
    16f0:	fed79ee3          	bne	a5,a3,16ec <memset+0xc4>
    16f4:	ff837693          	andi	a3,t1,-8
    16f8:	00de87b3          	add	a5,t4,a3
    16fc:	01e6873b          	addw	a4,a3,t5
    1700:	0ad30663          	beq	t1,a3,17ac <memset+0x184>
    1704:	00b78023          	sb	a1,0(a5)
    1708:	0017069b          	addiw	a3,a4,1
    170c:	08c6fb63          	bleu	a2,a3,17a2 <memset+0x17a>
    1710:	00b780a3          	sb	a1,1(a5)
    1714:	0027069b          	addiw	a3,a4,2
    1718:	08c6f563          	bleu	a2,a3,17a2 <memset+0x17a>
    171c:	00b78123          	sb	a1,2(a5)
    1720:	0037069b          	addiw	a3,a4,3
    1724:	06c6ff63          	bleu	a2,a3,17a2 <memset+0x17a>
    1728:	00b781a3          	sb	a1,3(a5)
    172c:	0047069b          	addiw	a3,a4,4
    1730:	06c6f963          	bleu	a2,a3,17a2 <memset+0x17a>
    1734:	00b78223          	sb	a1,4(a5)
    1738:	0057069b          	addiw	a3,a4,5
    173c:	06c6f363          	bleu	a2,a3,17a2 <memset+0x17a>
    1740:	00b782a3          	sb	a1,5(a5)
    1744:	0067069b          	addiw	a3,a4,6
    1748:	04c6fd63          	bleu	a2,a3,17a2 <memset+0x17a>
    174c:	00b78323          	sb	a1,6(a5)
    1750:	0077069b          	addiw	a3,a4,7
    1754:	04c6f763          	bleu	a2,a3,17a2 <memset+0x17a>
    1758:	00b783a3          	sb	a1,7(a5)
    175c:	0087069b          	addiw	a3,a4,8
    1760:	04c6f163          	bleu	a2,a3,17a2 <memset+0x17a>
    1764:	00b78423          	sb	a1,8(a5)
    1768:	0097069b          	addiw	a3,a4,9
    176c:	02c6fb63          	bleu	a2,a3,17a2 <memset+0x17a>
    1770:	00b784a3          	sb	a1,9(a5)
    1774:	00a7069b          	addiw	a3,a4,10
    1778:	02c6f563          	bleu	a2,a3,17a2 <memset+0x17a>
    177c:	00b78523          	sb	a1,10(a5)
    1780:	00b7069b          	addiw	a3,a4,11
    1784:	00c6ff63          	bleu	a2,a3,17a2 <memset+0x17a>
    1788:	00b785a3          	sb	a1,11(a5)
    178c:	00c7069b          	addiw	a3,a4,12
    1790:	00c6f963          	bleu	a2,a3,17a2 <memset+0x17a>
    1794:	00b78623          	sb	a1,12(a5)
    1798:	2735                	addiw	a4,a4,13
    179a:	00c77463          	bleu	a2,a4,17a2 <memset+0x17a>
    179e:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    17a2:	8082                	ret
    17a4:	472d                	li	a4,11
    17a6:	bd79                	j	1644 <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    17a8:	4f0d                	li	t5,3
    17aa:	b701                	j	16aa <memset+0x82>
    17ac:	8082                	ret
    17ae:	4f05                	li	t5,1
    17b0:	bded                	j	16aa <memset+0x82>
    17b2:	8eaa                	mv	t4,a0
    17b4:	4f01                	li	t5,0
    17b6:	bdd5                	j	16aa <memset+0x82>
    17b8:	87aa                	mv	a5,a0
    17ba:	4701                	li	a4,0
    17bc:	b7a1                	j	1704 <memset+0xdc>
    17be:	4f09                	li	t5,2
    17c0:	b5ed                	j	16aa <memset+0x82>
    17c2:	4f11                	li	t5,4
    17c4:	b5dd                	j	16aa <memset+0x82>
    17c6:	4f15                	li	t5,5
    17c8:	b5cd                	j	16aa <memset+0x82>
    17ca:	4f19                	li	t5,6
    17cc:	bdf9                	j	16aa <memset+0x82>

00000000000017ce <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    17ce:	00054703          	lbu	a4,0(a0)
    17d2:	0005c783          	lbu	a5,0(a1)
    17d6:	00e79b63          	bne	a5,a4,17ec <strcmp+0x1e>
    17da:	cf89                	beqz	a5,17f4 <strcmp+0x26>
    17dc:	0505                	addi	a0,a0,1
    17de:	0585                	addi	a1,a1,1
    17e0:	0005c783          	lbu	a5,0(a1)
    17e4:	00054703          	lbu	a4,0(a0)
    17e8:	fef709e3          	beq	a4,a5,17da <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    17ec:	0007051b          	sext.w	a0,a4
}
    17f0:	9d1d                	subw	a0,a0,a5
    17f2:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    17f4:	4501                	li	a0,0
}
    17f6:	9d1d                	subw	a0,a0,a5
    17f8:	8082                	ret

00000000000017fa <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17fa:	c231                	beqz	a2,183e <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17fc:	00054783          	lbu	a5,0(a0)
    1800:	0005c683          	lbu	a3,0(a1)
    1804:	c795                	beqz	a5,1830 <strncmp+0x36>
    1806:	ca85                	beqz	a3,1836 <strncmp+0x3c>
    if (!n--)
    1808:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    180a:	c615                	beqz	a2,1836 <strncmp+0x3c>
    180c:	00150713          	addi	a4,a0,1
    1810:	9532                	add	a0,a0,a2
    1812:	00d78963          	beq	a5,a3,1824 <strncmp+0x2a>
    1816:	a005                	j	1836 <strncmp+0x3c>
    1818:	ce99                	beqz	a3,1836 <strncmp+0x3c>
    181a:	00e50e63          	beq	a0,a4,1836 <strncmp+0x3c>
    181e:	0705                	addi	a4,a4,1
    1820:	00d79b63          	bne	a5,a3,1836 <strncmp+0x3c>
    1824:	00074783          	lbu	a5,0(a4)
    1828:	0585                	addi	a1,a1,1
    182a:	0005c683          	lbu	a3,0(a1)
    182e:	f7ed                	bnez	a5,1818 <strncmp+0x1e>
    1830:	4501                	li	a0,0
        ;
    return *l - *r;
    1832:	9d15                	subw	a0,a0,a3
    1834:	8082                	ret
    1836:	0007851b          	sext.w	a0,a5
    183a:	9d15                	subw	a0,a0,a3
    183c:	8082                	ret
        return 0;
    183e:	4501                	li	a0,0
}
    1840:	8082                	ret

0000000000001842 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    1842:	00757793          	andi	a5,a0,7
    1846:	cfa1                	beqz	a5,189e <strlen+0x5c>
        if (!*s)
    1848:	00054783          	lbu	a5,0(a0)
    184c:	cbb9                	beqz	a5,18a2 <strlen+0x60>
    184e:	87aa                	mv	a5,a0
    1850:	a021                	j	1858 <strlen+0x16>
    1852:	0007c703          	lbu	a4,0(a5)
    1856:	c329                	beqz	a4,1898 <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    1858:	0785                	addi	a5,a5,1
    185a:	0077f713          	andi	a4,a5,7
    185e:	fb75                	bnez	a4,1852 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1860:	00000717          	auipc	a4,0x0
    1864:	7d070713          	addi	a4,a4,2000 # 2030 <__clone+0x98>
    1868:	630c                	ld	a1,0(a4)
    186a:	00000717          	auipc	a4,0x0
    186e:	7ce70713          	addi	a4,a4,1998 # 2038 <__clone+0xa0>
    1872:	6394                	ld	a3,0(a5)
    1874:	6310                	ld	a2,0(a4)
    1876:	a019                	j	187c <strlen+0x3a>
    1878:	07a1                	addi	a5,a5,8
    187a:	6394                	ld	a3,0(a5)
    187c:	00b68733          	add	a4,a3,a1
    1880:	fff6c693          	not	a3,a3
    1884:	8f75                	and	a4,a4,a3
    1886:	8f71                	and	a4,a4,a2
    1888:	db65                	beqz	a4,1878 <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    188a:	0007c703          	lbu	a4,0(a5)
    188e:	c709                	beqz	a4,1898 <strlen+0x56>
    1890:	0785                	addi	a5,a5,1
    1892:	0007c703          	lbu	a4,0(a5)
    1896:	ff6d                	bnez	a4,1890 <strlen+0x4e>
        ;
    return s - a;
    1898:	40a78533          	sub	a0,a5,a0
}
    189c:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    189e:	87aa                	mv	a5,a0
    18a0:	b7c1                	j	1860 <strlen+0x1e>
        if (!*s)
    18a2:	4501                	li	a0,0
            return s - a;
    18a4:	8082                	ret

00000000000018a6 <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    18a6:	00757793          	andi	a5,a0,7
    18aa:	0ff5f593          	andi	a1,a1,255
    18ae:	cb99                	beqz	a5,18c4 <memchr+0x1e>
    18b0:	c655                	beqz	a2,195c <memchr+0xb6>
    18b2:	00054783          	lbu	a5,0(a0)
    18b6:	0ab78663          	beq	a5,a1,1962 <memchr+0xbc>
    18ba:	0505                	addi	a0,a0,1
    18bc:	00757793          	andi	a5,a0,7
    18c0:	167d                	addi	a2,a2,-1
    18c2:	f7fd                	bnez	a5,18b0 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    18c4:	4701                	li	a4,0
    if (n && *s != c)
    18c6:	ca49                	beqz	a2,1958 <memchr+0xb2>
    18c8:	00054783          	lbu	a5,0(a0)
    18cc:	08b78b63          	beq	a5,a1,1962 <memchr+0xbc>
        size_t k = ONES * c;
    18d0:	00000797          	auipc	a5,0x0
    18d4:	77078793          	addi	a5,a5,1904 # 2040 <__clone+0xa8>
    18d8:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18da:	479d                	li	a5,7
        size_t k = ONES * c;
    18dc:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    18e0:	08c7f863          	bleu	a2,a5,1970 <memchr+0xca>
    18e4:	611c                	ld	a5,0(a0)
    18e6:	00000317          	auipc	t1,0x0
    18ea:	75230313          	addi	t1,t1,1874 # 2038 <__clone+0xa0>
    18ee:	00033803          	ld	a6,0(t1)
    18f2:	00f8c7b3          	xor	a5,a7,a5
    18f6:	fff7c713          	not	a4,a5
    18fa:	8f95                	sub	a5,a5,a3
    18fc:	8ff9                	and	a5,a5,a4
    18fe:	0107f7b3          	and	a5,a5,a6
    1902:	e7bd                	bnez	a5,1970 <memchr+0xca>
    1904:	4e1d                	li	t3,7
    1906:	00000e97          	auipc	t4,0x0
    190a:	72ae8e93          	addi	t4,t4,1834 # 2030 <__clone+0x98>
    190e:	a005                	j	192e <memchr+0x88>
    1910:	6514                	ld	a3,8(a0)
    1912:	000eb783          	ld	a5,0(t4)
    1916:	00033803          	ld	a6,0(t1)
    191a:	00d8c6b3          	xor	a3,a7,a3
    191e:	97b6                	add	a5,a5,a3
    1920:	fff6c693          	not	a3,a3
    1924:	8ff5                	and	a5,a5,a3
    1926:	0107f7b3          	and	a5,a5,a6
    192a:	e3a1                	bnez	a5,196a <memchr+0xc4>
    192c:	853a                	mv	a0,a4
    192e:	1661                	addi	a2,a2,-8
    1930:	00850713          	addi	a4,a0,8
    1934:	fcce6ee3          	bltu	t3,a2,1910 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    1938:	c215                	beqz	a2,195c <memchr+0xb6>
    193a:	00074783          	lbu	a5,0(a4)
    193e:	00f58d63          	beq	a1,a5,1958 <memchr+0xb2>
    1942:	00170793          	addi	a5,a4,1
    1946:	963a                	add	a2,a2,a4
    1948:	873e                	mv	a4,a5
    194a:	00f60963          	beq	a2,a5,195c <memchr+0xb6>
    194e:	0007c683          	lbu	a3,0(a5)
    1952:	0785                	addi	a5,a5,1
    1954:	feb69ae3          	bne	a3,a1,1948 <memchr+0xa2>
}
    1958:	853a                	mv	a0,a4
    195a:	8082                	ret
    return n ? (void *)s : 0;
    195c:	4701                	li	a4,0
}
    195e:	853a                	mv	a0,a4
    1960:	8082                	ret
    1962:	872a                	mv	a4,a0
    1964:	00074783          	lbu	a5,0(a4)
    1968:	bfd9                	j	193e <memchr+0x98>
    196a:	00854783          	lbu	a5,8(a0)
    196e:	bfc1                	j	193e <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1970:	872a                	mv	a4,a0
    1972:	bfc1                	j	1942 <memchr+0x9c>

0000000000001974 <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1974:	00757793          	andi	a5,a0,7
    1978:	cfc5                	beqz	a5,1a30 <strnlen+0xbc>
    197a:	c1c5                	beqz	a1,1a1a <strnlen+0xa6>
    197c:	00054783          	lbu	a5,0(a0)
    1980:	cfd9                	beqz	a5,1a1e <strnlen+0xaa>
    1982:	87ae                	mv	a5,a1
    1984:	86aa                	mv	a3,a0
    1986:	a029                	j	1990 <strnlen+0x1c>
    1988:	cbc9                	beqz	a5,1a1a <strnlen+0xa6>
    198a:	0006c703          	lbu	a4,0(a3)
    198e:	cb51                	beqz	a4,1a22 <strnlen+0xae>
    1990:	0685                	addi	a3,a3,1
    1992:	0076f713          	andi	a4,a3,7
    1996:	17fd                	addi	a5,a5,-1
    1998:	fb65                	bnez	a4,1988 <strnlen+0x14>
    if (n && *s != c)
    199a:	c3c1                	beqz	a5,1a1a <strnlen+0xa6>
    199c:	0006c703          	lbu	a4,0(a3)
    19a0:	c349                	beqz	a4,1a22 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19a2:	471d                	li	a4,7
    19a4:	08f77a63          	bleu	a5,a4,1a38 <strnlen+0xc4>
    19a8:	00000e17          	auipc	t3,0x0
    19ac:	688e0e13          	addi	t3,t3,1672 # 2030 <__clone+0x98>
    19b0:	6290                	ld	a2,0(a3)
    19b2:	000e3703          	ld	a4,0(t3)
    19b6:	00000e97          	auipc	t4,0x0
    19ba:	682e8e93          	addi	t4,t4,1666 # 2038 <__clone+0xa0>
    19be:	000eb803          	ld	a6,0(t4)
    19c2:	9732                	add	a4,a4,a2
    19c4:	fff64613          	not	a2,a2
    19c8:	8f71                	and	a4,a4,a2
    19ca:	01077733          	and	a4,a4,a6
    19ce:	e72d                	bnez	a4,1a38 <strnlen+0xc4>
    19d0:	4f1d                	li	t5,7
    19d2:	a839                	j	19f0 <strnlen+0x7c>
    19d4:	6698                	ld	a4,8(a3)
    19d6:	000e3303          	ld	t1,0(t3)
    19da:	000eb803          	ld	a6,0(t4)
    19de:	fff74893          	not	a7,a4
    19e2:	971a                	add	a4,a4,t1
    19e4:	01177733          	and	a4,a4,a7
    19e8:	01077733          	and	a4,a4,a6
    19ec:	ef1d                	bnez	a4,1a2a <strnlen+0xb6>
    19ee:	86b2                	mv	a3,a2
    19f0:	17e1                	addi	a5,a5,-8
    19f2:	00868613          	addi	a2,a3,8
    19f6:	fcff6fe3          	bltu	t5,a5,19d4 <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    19fa:	c385                	beqz	a5,1a1a <strnlen+0xa6>
    19fc:	00064703          	lbu	a4,0(a2)
    1a00:	cb19                	beqz	a4,1a16 <strnlen+0xa2>
    1a02:	00160713          	addi	a4,a2,1
    1a06:	97b2                	add	a5,a5,a2
    1a08:	863a                	mv	a2,a4
    1a0a:	00e78863          	beq	a5,a4,1a1a <strnlen+0xa6>
    1a0e:	0705                	addi	a4,a4,1
    1a10:	fff74683          	lbu	a3,-1(a4)
    1a14:	faf5                	bnez	a3,1a08 <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    1a16:	40a605b3          	sub	a1,a2,a0
}
    1a1a:	852e                	mv	a0,a1
    1a1c:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a1e:	87ae                	mv	a5,a1
    1a20:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a22:	8636                	mv	a2,a3
    1a24:	00064703          	lbu	a4,0(a2)
    1a28:	bfe1                	j	1a00 <strnlen+0x8c>
    1a2a:	0086c703          	lbu	a4,8(a3)
    1a2e:	bfc9                	j	1a00 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    1a30:	87ae                	mv	a5,a1
    1a32:	86aa                	mv	a3,a0
    if (n && *s != c)
    1a34:	f7a5                	bnez	a5,199c <strnlen+0x28>
    1a36:	b7d5                	j	1a1a <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1a38:	8636                	mv	a2,a3
    1a3a:	b7e1                	j	1a02 <strnlen+0x8e>

0000000000001a3c <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    1a3c:	00b547b3          	xor	a5,a0,a1
    1a40:	8b9d                	andi	a5,a5,7
    1a42:	efa9                	bnez	a5,1a9c <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    1a44:	0075f793          	andi	a5,a1,7
    1a48:	c38d                	beqz	a5,1a6a <strcpy+0x2e>
            if (!(*d = *s))
    1a4a:	0005c783          	lbu	a5,0(a1)
    1a4e:	00f50023          	sb	a5,0(a0)
    1a52:	e799                	bnez	a5,1a60 <strcpy+0x24>
    1a54:	a095                	j	1ab8 <strcpy+0x7c>
    1a56:	0005c783          	lbu	a5,0(a1)
    1a5a:	00f50023          	sb	a5,0(a0)
    1a5e:	cbb9                	beqz	a5,1ab4 <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a60:	0585                	addi	a1,a1,1
    1a62:	0075f793          	andi	a5,a1,7
    1a66:	0505                	addi	a0,a0,1
    1a68:	f7fd                	bnez	a5,1a56 <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a6a:	00000797          	auipc	a5,0x0
    1a6e:	5c678793          	addi	a5,a5,1478 # 2030 <__clone+0x98>
    1a72:	0007b803          	ld	a6,0(a5)
    1a76:	00000797          	auipc	a5,0x0
    1a7a:	5c278793          	addi	a5,a5,1474 # 2038 <__clone+0xa0>
    1a7e:	6198                	ld	a4,0(a1)
    1a80:	6390                	ld	a2,0(a5)
    1a82:	a031                	j	1a8e <strcpy+0x52>
    1a84:	0521                	addi	a0,a0,8
    1a86:	05a1                	addi	a1,a1,8
    1a88:	fee53c23          	sd	a4,-8(a0)
    1a8c:	6198                	ld	a4,0(a1)
    1a8e:	010707b3          	add	a5,a4,a6
    1a92:	fff74693          	not	a3,a4
    1a96:	8ff5                	and	a5,a5,a3
    1a98:	8ff1                	and	a5,a5,a2
    1a9a:	d7ed                	beqz	a5,1a84 <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a9c:	0005c783          	lbu	a5,0(a1)
    1aa0:	00f50023          	sb	a5,0(a0)
    1aa4:	cb89                	beqz	a5,1ab6 <strcpy+0x7a>
    1aa6:	0585                	addi	a1,a1,1
    1aa8:	0005c783          	lbu	a5,0(a1)
    1aac:	0505                	addi	a0,a0,1
    1aae:	00f50023          	sb	a5,0(a0)
    1ab2:	fbf5                	bnez	a5,1aa6 <strcpy+0x6a>
        ;
    return d;
}
    1ab4:	8082                	ret
    1ab6:	8082                	ret
    1ab8:	8082                	ret

0000000000001aba <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1aba:	00b547b3          	xor	a5,a0,a1
    1abe:	8b9d                	andi	a5,a5,7
    1ac0:	ebc1                	bnez	a5,1b50 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1ac2:	0075f793          	andi	a5,a1,7
    1ac6:	cf91                	beqz	a5,1ae2 <strncpy+0x28>
    1ac8:	20060e63          	beqz	a2,1ce4 <strncpy+0x22a>
    1acc:	0005c783          	lbu	a5,0(a1)
    1ad0:	00f50023          	sb	a5,0(a0)
    1ad4:	c3d5                	beqz	a5,1b78 <strncpy+0xbe>
    1ad6:	0585                	addi	a1,a1,1
    1ad8:	0075f793          	andi	a5,a1,7
    1adc:	167d                	addi	a2,a2,-1
    1ade:	0505                	addi	a0,a0,1
    1ae0:	f7e5                	bnez	a5,1ac8 <strncpy+0xe>
            ;
        if (!n || !*s)
    1ae2:	20060163          	beqz	a2,1ce4 <strncpy+0x22a>
    1ae6:	0005c683          	lbu	a3,0(a1)
    1aea:	c6d9                	beqz	a3,1b78 <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1aec:	479d                	li	a5,7
    1aee:	22c7f563          	bleu	a2,a5,1d18 <strncpy+0x25e>
    1af2:	00000317          	auipc	t1,0x0
    1af6:	53e30313          	addi	t1,t1,1342 # 2030 <__clone+0x98>
    1afa:	6198                	ld	a4,0(a1)
    1afc:	00033783          	ld	a5,0(t1)
    1b00:	00000e17          	auipc	t3,0x0
    1b04:	538e0e13          	addi	t3,t3,1336 # 2038 <__clone+0xa0>
    1b08:	000e3803          	ld	a6,0(t3)
    1b0c:	97ba                	add	a5,a5,a4
    1b0e:	fff74893          	not	a7,a4
    1b12:	0117f7b3          	and	a5,a5,a7
    1b16:	0107f7b3          	and	a5,a5,a6
    1b1a:	1e079f63          	bnez	a5,1d18 <strncpy+0x25e>
    1b1e:	4e9d                	li	t4,7
    1b20:	a005                	j	1b40 <strncpy+0x86>
    1b22:	6598                	ld	a4,8(a1)
    1b24:	00033783          	ld	a5,0(t1)
    1b28:	000e3803          	ld	a6,0(t3)
    1b2c:	fff74893          	not	a7,a4
    1b30:	97ba                	add	a5,a5,a4
    1b32:	0117f7b3          	and	a5,a5,a7
    1b36:	0107f7b3          	and	a5,a5,a6
    1b3a:	1a079f63          	bnez	a5,1cf8 <strncpy+0x23e>
    1b3e:	85b6                	mv	a1,a3
            *wd = *ws;
    1b40:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1b42:	1661                	addi	a2,a2,-8
    1b44:	00858693          	addi	a3,a1,8
    1b48:	0521                	addi	a0,a0,8
    1b4a:	fcceece3          	bltu	t4,a2,1b22 <strncpy+0x68>
    1b4e:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1b50:	18060a63          	beqz	a2,1ce4 <strncpy+0x22a>
    1b54:	0005c783          	lbu	a5,0(a1)
    1b58:	872a                	mv	a4,a0
    1b5a:	00f50023          	sb	a5,0(a0)
    1b5e:	e799                	bnez	a5,1b6c <strncpy+0xb2>
    1b60:	a829                	j	1b7a <strncpy+0xc0>
    1b62:	0005c783          	lbu	a5,0(a1)
    1b66:	00f70023          	sb	a5,0(a4)
    1b6a:	cb81                	beqz	a5,1b7a <strncpy+0xc0>
    1b6c:	167d                	addi	a2,a2,-1
    1b6e:	0585                	addi	a1,a1,1
    1b70:	0705                	addi	a4,a4,1
    1b72:	fa65                	bnez	a2,1b62 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b74:	853a                	mv	a0,a4
    1b76:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b78:	872a                	mv	a4,a0
    1b7a:	4805                	li	a6,1
    1b7c:	14061c63          	bnez	a2,1cd4 <strncpy+0x21a>
    1b80:	40e007b3          	neg	a5,a4
    1b84:	8b9d                	andi	a5,a5,7
    1b86:	4581                	li	a1,0
    1b88:	12061e63          	bnez	a2,1cc4 <strncpy+0x20a>
    1b8c:	00778693          	addi	a3,a5,7
    1b90:	452d                	li	a0,11
    1b92:	12a6e763          	bltu	a3,a0,1cc0 <strncpy+0x206>
    1b96:	16d5e663          	bltu	a1,a3,1d02 <strncpy+0x248>
    1b9a:	14078c63          	beqz	a5,1cf2 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b9e:	00070023          	sb	zero,0(a4)
    1ba2:	4585                	li	a1,1
    1ba4:	00170693          	addi	a3,a4,1
    1ba8:	14b78363          	beq	a5,a1,1cee <strncpy+0x234>
    1bac:	000700a3          	sb	zero,1(a4)
    1bb0:	4589                	li	a1,2
    1bb2:	00270693          	addi	a3,a4,2
    1bb6:	14b78963          	beq	a5,a1,1d08 <strncpy+0x24e>
    1bba:	00070123          	sb	zero,2(a4)
    1bbe:	458d                	li	a1,3
    1bc0:	00370693          	addi	a3,a4,3
    1bc4:	12b78363          	beq	a5,a1,1cea <strncpy+0x230>
    1bc8:	000701a3          	sb	zero,3(a4)
    1bcc:	4591                	li	a1,4
    1bce:	00470693          	addi	a3,a4,4
    1bd2:	12b78d63          	beq	a5,a1,1d0c <strncpy+0x252>
    1bd6:	00070223          	sb	zero,4(a4)
    1bda:	4595                	li	a1,5
    1bdc:	00570693          	addi	a3,a4,5
    1be0:	12b78863          	beq	a5,a1,1d10 <strncpy+0x256>
    1be4:	000702a3          	sb	zero,5(a4)
    1be8:	459d                	li	a1,7
    1bea:	00670693          	addi	a3,a4,6
    1bee:	12b79363          	bne	a5,a1,1d14 <strncpy+0x25a>
    1bf2:	00770693          	addi	a3,a4,7
    1bf6:	00070323          	sb	zero,6(a4)
    1bfa:	40f80833          	sub	a6,a6,a5
    1bfe:	ff887513          	andi	a0,a6,-8
    1c02:	97ba                	add	a5,a5,a4
    1c04:	953e                	add	a0,a0,a5
    1c06:	0007b023          	sd	zero,0(a5)
    1c0a:	07a1                	addi	a5,a5,8
    1c0c:	fea79de3          	bne	a5,a0,1c06 <strncpy+0x14c>
    1c10:	ff887513          	andi	a0,a6,-8
    1c14:	9da9                	addw	a1,a1,a0
    1c16:	00a687b3          	add	a5,a3,a0
    1c1a:	f4a80de3          	beq	a6,a0,1b74 <strncpy+0xba>
    1c1e:	00078023          	sb	zero,0(a5)
    1c22:	0015869b          	addiw	a3,a1,1
    1c26:	f4c6f7e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c2a:	000780a3          	sb	zero,1(a5)
    1c2e:	0025869b          	addiw	a3,a1,2
    1c32:	f4c6f1e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c36:	00078123          	sb	zero,2(a5)
    1c3a:	0035869b          	addiw	a3,a1,3
    1c3e:	f2c6fbe3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c42:	000781a3          	sb	zero,3(a5)
    1c46:	0045869b          	addiw	a3,a1,4
    1c4a:	f2c6f5e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c4e:	00078223          	sb	zero,4(a5)
    1c52:	0055869b          	addiw	a3,a1,5
    1c56:	f0c6ffe3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c5a:	000782a3          	sb	zero,5(a5)
    1c5e:	0065869b          	addiw	a3,a1,6
    1c62:	f0c6f9e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c66:	00078323          	sb	zero,6(a5)
    1c6a:	0075869b          	addiw	a3,a1,7
    1c6e:	f0c6f3e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c72:	000783a3          	sb	zero,7(a5)
    1c76:	0085869b          	addiw	a3,a1,8
    1c7a:	eec6fde3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c7e:	00078423          	sb	zero,8(a5)
    1c82:	0095869b          	addiw	a3,a1,9
    1c86:	eec6f7e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c8a:	000784a3          	sb	zero,9(a5)
    1c8e:	00a5869b          	addiw	a3,a1,10
    1c92:	eec6f1e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1c96:	00078523          	sb	zero,10(a5)
    1c9a:	00b5869b          	addiw	a3,a1,11
    1c9e:	ecc6fbe3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1ca2:	000785a3          	sb	zero,11(a5)
    1ca6:	00c5869b          	addiw	a3,a1,12
    1caa:	ecc6f5e3          	bleu	a2,a3,1b74 <strncpy+0xba>
    1cae:	00078623          	sb	zero,12(a5)
    1cb2:	25b5                	addiw	a1,a1,13
    1cb4:	ecc5f0e3          	bleu	a2,a1,1b74 <strncpy+0xba>
    1cb8:	000786a3          	sb	zero,13(a5)
}
    1cbc:	853a                	mv	a0,a4
    1cbe:	8082                	ret
    1cc0:	46ad                	li	a3,11
    1cc2:	bdd1                	j	1b96 <strncpy+0xdc>
    1cc4:	00778693          	addi	a3,a5,7
    1cc8:	452d                	li	a0,11
    1cca:	fff60593          	addi	a1,a2,-1
    1cce:	eca6f4e3          	bleu	a0,a3,1b96 <strncpy+0xdc>
    1cd2:	b7fd                	j	1cc0 <strncpy+0x206>
    1cd4:	40e007b3          	neg	a5,a4
    1cd8:	8832                	mv	a6,a2
    1cda:	8b9d                	andi	a5,a5,7
    1cdc:	4581                	li	a1,0
    1cde:	ea0607e3          	beqz	a2,1b8c <strncpy+0xd2>
    1ce2:	b7cd                	j	1cc4 <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1ce4:	872a                	mv	a4,a0
}
    1ce6:	853a                	mv	a0,a4
    1ce8:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1cea:	458d                	li	a1,3
    1cec:	b739                	j	1bfa <strncpy+0x140>
    1cee:	4585                	li	a1,1
    1cf0:	b729                	j	1bfa <strncpy+0x140>
    1cf2:	86ba                	mv	a3,a4
    1cf4:	4581                	li	a1,0
    1cf6:	b711                	j	1bfa <strncpy+0x140>
    1cf8:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1cfc:	872a                	mv	a4,a0
    1cfe:	85b6                	mv	a1,a3
    1d00:	bda9                	j	1b5a <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1d02:	87ba                	mv	a5,a4
    1d04:	4581                	li	a1,0
    1d06:	bf21                	j	1c1e <strncpy+0x164>
    1d08:	4589                	li	a1,2
    1d0a:	bdc5                	j	1bfa <strncpy+0x140>
    1d0c:	4591                	li	a1,4
    1d0e:	b5f5                	j	1bfa <strncpy+0x140>
    1d10:	4595                	li	a1,5
    1d12:	b5e5                	j	1bfa <strncpy+0x140>
    1d14:	4599                	li	a1,6
    1d16:	b5d5                	j	1bfa <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1d18:	00d50023          	sb	a3,0(a0)
    1d1c:	872a                	mv	a4,a0
    1d1e:	b5b9                	j	1b6c <strncpy+0xb2>

0000000000001d20 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1d20:	87aa                	mv	a5,a0
    1d22:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1d24:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1d28:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1d2c:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1d2e:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d30:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1d34:	2501                	sext.w	a0,a0
    1d36:	8082                	ret

0000000000001d38 <openat>:
    register long a7 __asm__("a7") = n;
    1d38:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1d3c:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d40:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1d44:	2501                	sext.w	a0,a0
    1d46:	8082                	ret

0000000000001d48 <close>:
    register long a7 __asm__("a7") = n;
    1d48:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1d4c:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1d50:	2501                	sext.w	a0,a0
    1d52:	8082                	ret

0000000000001d54 <read>:
    register long a7 __asm__("a7") = n;
    1d54:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d58:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d5c:	8082                	ret

0000000000001d5e <write>:
    register long a7 __asm__("a7") = n;
    1d5e:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d62:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d66:	8082                	ret

0000000000001d68 <getpid>:
    register long a7 __asm__("a7") = n;
    1d68:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d6c:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d70:	2501                	sext.w	a0,a0
    1d72:	8082                	ret

0000000000001d74 <getppid>:
    register long a7 __asm__("a7") = n;
    1d74:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d78:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d7c:	2501                	sext.w	a0,a0
    1d7e:	8082                	ret

0000000000001d80 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d80:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d84:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d88:	2501                	sext.w	a0,a0
    1d8a:	8082                	ret

0000000000001d8c <fork>:
    register long a7 __asm__("a7") = n;
    1d8c:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d90:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d92:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d94:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d98:	2501                	sext.w	a0,a0
    1d9a:	8082                	ret

0000000000001d9c <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d9c:	85b2                	mv	a1,a2
    1d9e:	863a                	mv	a2,a4
    if (stack)
    1da0:	c191                	beqz	a1,1da4 <clone+0x8>
	stack += stack_size;
    1da2:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1da4:	4781                	li	a5,0
    1da6:	4701                	li	a4,0
    1da8:	4681                	li	a3,0
    1daa:	2601                	sext.w	a2,a2
    1dac:	1ec0006f          	j	1f98 <__clone>

0000000000001db0 <exit>:
    register long a7 __asm__("a7") = n;
    1db0:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1db4:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1db8:	8082                	ret

0000000000001dba <waitpid>:
    register long a7 __asm__("a7") = n;
    1dba:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1dbe:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1dc0:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1dc4:	2501                	sext.w	a0,a0
    1dc6:	8082                	ret

0000000000001dc8 <exec>:
    register long a7 __asm__("a7") = n;
    1dc8:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1dcc:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1dd0:	2501                	sext.w	a0,a0
    1dd2:	8082                	ret

0000000000001dd4 <execve>:
    register long a7 __asm__("a7") = n;
    1dd4:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1dd8:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1ddc:	2501                	sext.w	a0,a0
    1dde:	8082                	ret

0000000000001de0 <times>:
    register long a7 __asm__("a7") = n;
    1de0:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1de4:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1de8:	2501                	sext.w	a0,a0
    1dea:	8082                	ret

0000000000001dec <get_time>:

int64 get_time()
{
    1dec:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1dee:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1df2:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1df4:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1df6:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1dfa:	2501                	sext.w	a0,a0
    1dfc:	ed09                	bnez	a0,1e16 <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1dfe:	67a2                	ld	a5,8(sp)
    1e00:	3e800713          	li	a4,1000
    1e04:	00015503          	lhu	a0,0(sp)
    1e08:	02e7d7b3          	divu	a5,a5,a4
    1e0c:	02e50533          	mul	a0,a0,a4
    1e10:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1e12:	0141                	addi	sp,sp,16
    1e14:	8082                	ret
        return -1;
    1e16:	557d                	li	a0,-1
    1e18:	bfed                	j	1e12 <get_time+0x26>

0000000000001e1a <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1e1a:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e1e:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1e22:	2501                	sext.w	a0,a0
    1e24:	8082                	ret

0000000000001e26 <time>:
    register long a7 __asm__("a7") = n;
    1e26:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1e2a:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1e2e:	2501                	sext.w	a0,a0
    1e30:	8082                	ret

0000000000001e32 <sleep>:

int sleep(unsigned long long time)
{
    1e32:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1e34:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1e36:	850a                	mv	a0,sp
    1e38:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1e3a:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1e3e:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e40:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e44:	e501                	bnez	a0,1e4c <sleep+0x1a>
    return 0;
    1e46:	4501                	li	a0,0
}
    1e48:	0141                	addi	sp,sp,16
    1e4a:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1e4c:	4502                	lw	a0,0(sp)
}
    1e4e:	0141                	addi	sp,sp,16
    1e50:	8082                	ret

0000000000001e52 <set_priority>:
    register long a7 __asm__("a7") = n;
    1e52:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1e56:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e5e:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e62:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e66:	8082                	ret

0000000000001e68 <munmap>:
    register long a7 __asm__("a7") = n;
    1e68:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e6c:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e70:	2501                	sext.w	a0,a0
    1e72:	8082                	ret

0000000000001e74 <wait>:

int wait(int *code)
{
    1e74:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e76:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e7a:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e7c:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e7e:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e80:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e84:	2501                	sext.w	a0,a0
    1e86:	8082                	ret

0000000000001e88 <spawn>:
    register long a7 __asm__("a7") = n;
    1e88:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e8c:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e90:	2501                	sext.w	a0,a0
    1e92:	8082                	ret

0000000000001e94 <mailread>:
    register long a7 __asm__("a7") = n;
    1e94:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e98:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e9c:	2501                	sext.w	a0,a0
    1e9e:	8082                	ret

0000000000001ea0 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1ea0:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea4:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1ea8:	2501                	sext.w	a0,a0
    1eaa:	8082                	ret

0000000000001eac <fstat>:
    register long a7 __asm__("a7") = n;
    1eac:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1eb0:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1eb4:	2501                	sext.w	a0,a0
    1eb6:	8082                	ret

0000000000001eb8 <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1eb8:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1eba:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1ebe:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1ec0:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1ec4:	2501                	sext.w	a0,a0
    1ec6:	8082                	ret

0000000000001ec8 <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1ec8:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1eca:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1ece:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ed0:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1ed4:	2501                	sext.w	a0,a0
    1ed6:	8082                	ret

0000000000001ed8 <link>:

int link(char *old_path, char *new_path)
{
    1ed8:	87aa                	mv	a5,a0
    1eda:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1edc:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1ee0:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1ee4:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1ee6:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1eea:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1eec:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <unlink>:

int unlink(char *path)
{
    1ef4:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1ef6:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1efa:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1efe:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f00:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1f04:	2501                	sext.w	a0,a0
    1f06:	8082                	ret

0000000000001f08 <uname>:
    register long a7 __asm__("a7") = n;
    1f08:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1f0c:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1f10:	2501                	sext.w	a0,a0
    1f12:	8082                	ret

0000000000001f14 <brk>:
    register long a7 __asm__("a7") = n;
    1f14:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1f18:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1f1c:	2501                	sext.w	a0,a0
    1f1e:	8082                	ret

0000000000001f20 <getcwd>:
    register long a7 __asm__("a7") = n;
    1f20:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f22:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1f26:	8082                	ret

0000000000001f28 <chdir>:
    register long a7 __asm__("a7") = n;
    1f28:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1f2c:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1f30:	2501                	sext.w	a0,a0
    1f32:	8082                	ret

0000000000001f34 <mkdir>:

int mkdir(const char *path, mode_t mode){
    1f34:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1f36:	02059613          	slli	a2,a1,0x20
    1f3a:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1f3c:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1f40:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1f44:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f46:	00000073          	ecall
}
    1f4a:	2501                	sext.w	a0,a0
    1f4c:	8082                	ret

0000000000001f4e <getdents>:
    register long a7 __asm__("a7") = n;
    1f4e:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f52:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1f56:	2501                	sext.w	a0,a0
    1f58:	8082                	ret

0000000000001f5a <pipe>:
    register long a7 __asm__("a7") = n;
    1f5a:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f5e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f60:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f64:	2501                	sext.w	a0,a0
    1f66:	8082                	ret

0000000000001f68 <dup>:
    register long a7 __asm__("a7") = n;
    1f68:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f6a:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f6e:	2501                	sext.w	a0,a0
    1f70:	8082                	ret

0000000000001f72 <dup2>:
    register long a7 __asm__("a7") = n;
    1f72:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f74:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f76:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f7a:	2501                	sext.w	a0,a0
    1f7c:	8082                	ret

0000000000001f7e <mount>:
    register long a7 __asm__("a7") = n;
    1f7e:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f82:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f86:	2501                	sext.w	a0,a0
    1f88:	8082                	ret

0000000000001f8a <umount>:
    register long a7 __asm__("a7") = n;
    1f8a:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f8e:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f90:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f94:	2501                	sext.w	a0,a0
    1f96:	8082                	ret

0000000000001f98 <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f98:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f9a:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f9c:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f9e:	8532                	mv	a0,a2
	mv a2, a4
    1fa0:	863a                	mv	a2,a4
	mv a3, a5
    1fa2:	86be                	mv	a3,a5
	mv a4, a6
    1fa4:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1fa6:	0dc00893          	li	a7,220
	ecall
    1faa:	00000073          	ecall

	beqz a0, 1f
    1fae:	c111                	beqz	a0,1fb2 <__clone+0x1a>
	# Parent
	ret
    1fb0:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1fb2:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1fb4:	6522                	ld	a0,8(sp)
	jalr a1
    1fb6:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1fb8:	05d00893          	li	a7,93
	ecall
    1fbc:	00000073          	ecall
