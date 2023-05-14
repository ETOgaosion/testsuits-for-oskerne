
/home/bluespace/study/OS/OSKernel2023-550W/userspace/testsuits-for-oskernel/riscv-syscalls-testing/user/build/riscv64/test_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000001000 <_start>:
.section .text.entry
.globl _start
_start:
    mv a0, sp
    1000:	850a                	mv	a0,sp
    tail __start_main
    1002:	0400006f          	j	1042 <__start_main>

0000000000001006 <main>:

/*
 * for execve
 */

int main(int argc, char *argv[]){
    1006:	1141                	addi	sp,sp,-16
    printf("  I am test_echo.\nexecve success.\n");
    1008:	00001517          	auipc	a0,0x1
    100c:	f6050513          	addi	a0,a0,-160 # 1f68 <__clone+0x2a>
int main(int argc, char *argv[]){
    1010:	e406                	sd	ra,8(sp)
    printf("  I am test_echo.\nexecve success.\n");
    1012:	252000ef          	jal	ra,1264 <printf>
    TEST_END(__func__);
    1016:	00001517          	auipc	a0,0x1
    101a:	f7a50513          	addi	a0,a0,-134 # 1f90 <__clone+0x52>
    101e:	224000ef          	jal	ra,1242 <puts>
    1022:	00001517          	auipc	a0,0x1
    1026:	f9650513          	addi	a0,a0,-106 # 1fb8 <__func__.1006>
    102a:	218000ef          	jal	ra,1242 <puts>
    102e:	00001517          	auipc	a0,0x1
    1032:	f7250513          	addi	a0,a0,-142 # 1fa0 <__clone+0x62>
    1036:	20c000ef          	jal	ra,1242 <puts>
    return 0;
}
    103a:	60a2                	ld	ra,8(sp)
    103c:	4501                	li	a0,0
    103e:	0141                	addi	sp,sp,16
    1040:	8082                	ret

0000000000001042 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long *p)
{
    1042:	85aa                	mv	a1,a0
	int argc = p[0];
	char **argv = (void *)(p+1);

	exit(main(argc, argv));
    1044:	4108                	lw	a0,0(a0)
{
    1046:	1141                	addi	sp,sp,-16
	exit(main(argc, argv));
    1048:	05a1                	addi	a1,a1,8
{
    104a:	e406                	sd	ra,8(sp)
	exit(main(argc, argv));
    104c:	fbbff0ef          	jal	ra,1006 <main>
    1050:	507000ef          	jal	ra,1d56 <exit>
	return 0;
}
    1054:	60a2                	ld	ra,8(sp)
    1056:	4501                	li	a0,0
    1058:	0141                	addi	sp,sp,16
    105a:	8082                	ret

000000000000105c <printint.constprop.0>:
    write(f, s, l);
}

static char digits[] = "0123456789abcdef";

static void printint(int xx, int base, int sign)
    105c:	7179                	addi	sp,sp,-48
    105e:	f406                	sd	ra,40(sp)
{
    char buf[16 + 1];
    int i;
    uint x;

    if (sign && (sign = xx < 0))
    1060:	12054e63          	bltz	a0,119c <printint.constprop.0+0x140>
        x = -xx;
    else
        x = xx;
    1064:	0005079b          	sext.w	a5,a0

    buf[16] = 0;
    1068:	2581                	sext.w	a1,a1
    i = 15;
    do
    {
        buf[i--] = digits[x % base];
    106a:	02b7f6bb          	remuw	a3,a5,a1
    106e:	00001717          	auipc	a4,0x1
    1072:	f6a70713          	addi	a4,a4,-150 # 1fd8 <digits>
    buf[16] = 0;
    1076:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    107a:	1682                	slli	a3,a3,0x20
    107c:	9281                	srli	a3,a3,0x20
    107e:	96ba                	add	a3,a3,a4
    1080:	0006c603          	lbu	a2,0(a3)
    } while ((x /= base) != 0);
    1084:	02b7d6bb          	divuw	a3,a5,a1
        buf[i--] = digits[x % base];
    1088:	00c10ba3          	sb	a2,23(sp)
    } while ((x /= base) != 0);
    108c:	16b7e363          	bltu	a5,a1,11f2 <printint.constprop.0+0x196>
        buf[i--] = digits[x % base];
    1090:	02b6f63b          	remuw	a2,a3,a1
    } while ((x /= base) != 0);
    1094:	02b6d7bb          	divuw	a5,a3,a1
        buf[i--] = digits[x % base];
    1098:	1602                	slli	a2,a2,0x20
    109a:	9201                	srli	a2,a2,0x20
    109c:	963a                	add	a2,a2,a4
    109e:	00064603          	lbu	a2,0(a2)
    10a2:	00c10b23          	sb	a2,22(sp)
    } while ((x /= base) != 0);
    10a6:	0007861b          	sext.w	a2,a5
    10aa:	12b6e863          	bltu	a3,a1,11da <printint.constprop.0+0x17e>
        buf[i--] = digits[x % base];
    10ae:	02b7f6bb          	remuw	a3,a5,a1
    10b2:	1682                	slli	a3,a3,0x20
    10b4:	9281                	srli	a3,a3,0x20
    10b6:	96ba                	add	a3,a3,a4
    10b8:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    10bc:	02b7d83b          	divuw	a6,a5,a1
        buf[i--] = digits[x % base];
    10c0:	00d10aa3          	sb	a3,21(sp)
    } while ((x /= base) != 0);
    10c4:	10b66e63          	bltu	a2,a1,11e0 <printint.constprop.0+0x184>
        buf[i--] = digits[x % base];
    10c8:	02b876bb          	remuw	a3,a6,a1
    10cc:	1682                	slli	a3,a3,0x20
    10ce:	9281                	srli	a3,a3,0x20
    10d0:	96ba                	add	a3,a3,a4
    10d2:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    10d6:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    10da:	00d10a23          	sb	a3,20(sp)
    } while ((x /= base) != 0);
    10de:	10b86463          	bltu	a6,a1,11e6 <printint.constprop.0+0x18a>
        buf[i--] = digits[x % base];
    10e2:	02b676bb          	remuw	a3,a2,a1
    10e6:	1682                	slli	a3,a3,0x20
    10e8:	9281                	srli	a3,a3,0x20
    10ea:	96ba                	add	a3,a3,a4
    10ec:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    10f0:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    10f4:	00d109a3          	sb	a3,19(sp)
    } while ((x /= base) != 0);
    10f8:	0eb66a63          	bltu	a2,a1,11ec <printint.constprop.0+0x190>
        buf[i--] = digits[x % base];
    10fc:	02b876bb          	remuw	a3,a6,a1
    1100:	1682                	slli	a3,a3,0x20
    1102:	9281                	srli	a3,a3,0x20
    1104:	96ba                	add	a3,a3,a4
    1106:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    110a:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    110e:	00d10923          	sb	a3,18(sp)
    } while ((x /= base) != 0);
    1112:	0cb86163          	bltu	a6,a1,11d4 <printint.constprop.0+0x178>
        buf[i--] = digits[x % base];
    1116:	02b676bb          	remuw	a3,a2,a1
    111a:	1682                	slli	a3,a3,0x20
    111c:	9281                	srli	a3,a3,0x20
    111e:	96ba                	add	a3,a3,a4
    1120:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1124:	02b6583b          	divuw	a6,a2,a1
        buf[i--] = digits[x % base];
    1128:	00d108a3          	sb	a3,17(sp)
    } while ((x /= base) != 0);
    112c:	0cb66563          	bltu	a2,a1,11f6 <printint.constprop.0+0x19a>
        buf[i--] = digits[x % base];
    1130:	02b876bb          	remuw	a3,a6,a1
    1134:	1682                	slli	a3,a3,0x20
    1136:	9281                	srli	a3,a3,0x20
    1138:	96ba                	add	a3,a3,a4
    113a:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    113e:	02b8563b          	divuw	a2,a6,a1
        buf[i--] = digits[x % base];
    1142:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    1146:	0ab86b63          	bltu	a6,a1,11fc <printint.constprop.0+0x1a0>
        buf[i--] = digits[x % base];
    114a:	02b676bb          	remuw	a3,a2,a1
    114e:	1682                	slli	a3,a3,0x20
    1150:	9281                	srli	a3,a3,0x20
    1152:	96ba                	add	a3,a3,a4
    1154:	0006c683          	lbu	a3,0(a3)
    } while ((x /= base) != 0);
    1158:	02b657bb          	divuw	a5,a2,a1
        buf[i--] = digits[x % base];
    115c:	00d107a3          	sb	a3,15(sp)
    } while ((x /= base) != 0);
    1160:	0ab66163          	bltu	a2,a1,1202 <printint.constprop.0+0x1a6>
        buf[i--] = digits[x % base];
    1164:	1782                	slli	a5,a5,0x20
    1166:	9381                	srli	a5,a5,0x20
    1168:	97ba                	add	a5,a5,a4
    116a:	0007c703          	lbu	a4,0(a5)
    116e:	4599                	li	a1,6
    1170:	4795                	li	a5,5
    1172:	00e10723          	sb	a4,14(sp)

    if (sign)
    1176:	00055963          	bgez	a0,1188 <printint.constprop.0+0x12c>
        buf[i--] = '-';
    117a:	1018                	addi	a4,sp,32
    117c:	973e                	add	a4,a4,a5
    117e:	02d00693          	li	a3,45
    1182:	fed70423          	sb	a3,-24(a4)
    1186:	85be                	mv	a1,a5
    write(f, s, l);
    1188:	003c                	addi	a5,sp,8
    118a:	4641                	li	a2,16
    118c:	9e0d                	subw	a2,a2,a1
    118e:	4505                	li	a0,1
    1190:	95be                	add	a1,a1,a5
    1192:	373000ef          	jal	ra,1d04 <write>
    i++;
    if (i < 0)
        puts("printint error");
    out(stdout, buf + i, 16 - i);
}
    1196:	70a2                	ld	ra,40(sp)
    1198:	6145                	addi	sp,sp,48
    119a:	8082                	ret
        x = -xx;
    119c:	40a0063b          	negw	a2,a0
    11a0:	2581                	sext.w	a1,a1
        buf[i--] = digits[x % base];
    11a2:	02b677bb          	remuw	a5,a2,a1
    11a6:	00001717          	auipc	a4,0x1
    11aa:	e3270713          	addi	a4,a4,-462 # 1fd8 <digits>
    buf[16] = 0;
    11ae:	00010c23          	sb	zero,24(sp)
        buf[i--] = digits[x % base];
    11b2:	1782                	slli	a5,a5,0x20
    11b4:	9381                	srli	a5,a5,0x20
    11b6:	97ba                	add	a5,a5,a4
    11b8:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    11bc:	02b656bb          	divuw	a3,a2,a1
        buf[i--] = digits[x % base];
    11c0:	00f10ba3          	sb	a5,23(sp)
    } while ((x /= base) != 0);
    11c4:	ecb676e3          	bleu	a1,a2,1090 <printint.constprop.0+0x34>
        buf[i--] = '-';
    11c8:	02d00793          	li	a5,45
    11cc:	00f10b23          	sb	a5,22(sp)
        buf[i--] = digits[x % base];
    11d0:	45b9                	li	a1,14
    11d2:	bf5d                	j	1188 <printint.constprop.0+0x12c>
    11d4:	47a5                	li	a5,9
    11d6:	45a9                	li	a1,10
    11d8:	bf79                	j	1176 <printint.constprop.0+0x11a>
    11da:	47b5                	li	a5,13
    11dc:	45b9                	li	a1,14
    11de:	bf61                	j	1176 <printint.constprop.0+0x11a>
    11e0:	47b1                	li	a5,12
    11e2:	45b5                	li	a1,13
    11e4:	bf49                	j	1176 <printint.constprop.0+0x11a>
    11e6:	47ad                	li	a5,11
    11e8:	45b1                	li	a1,12
    11ea:	b771                	j	1176 <printint.constprop.0+0x11a>
    11ec:	47a9                	li	a5,10
    11ee:	45ad                	li	a1,11
    11f0:	b759                	j	1176 <printint.constprop.0+0x11a>
    i = 15;
    11f2:	45bd                	li	a1,15
    11f4:	bf51                	j	1188 <printint.constprop.0+0x12c>
        buf[i--] = digits[x % base];
    11f6:	47a1                	li	a5,8
    11f8:	45a5                	li	a1,9
    11fa:	bfb5                	j	1176 <printint.constprop.0+0x11a>
    11fc:	479d                	li	a5,7
    11fe:	45a1                	li	a1,8
    1200:	bf9d                	j	1176 <printint.constprop.0+0x11a>
    1202:	4799                	li	a5,6
    1204:	459d                	li	a1,7
    1206:	bf85                	j	1176 <printint.constprop.0+0x11a>

0000000000001208 <getchar>:
{
    1208:	1101                	addi	sp,sp,-32
    read(stdin, &byte, 1);
    120a:	00f10593          	addi	a1,sp,15
    120e:	4605                	li	a2,1
    1210:	4501                	li	a0,0
{
    1212:	ec06                	sd	ra,24(sp)
    char byte = 0;
    1214:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    1218:	2e3000ef          	jal	ra,1cfa <read>
}
    121c:	60e2                	ld	ra,24(sp)
    121e:	00f14503          	lbu	a0,15(sp)
    1222:	6105                	addi	sp,sp,32
    1224:	8082                	ret

0000000000001226 <putchar>:
{
    1226:	1101                	addi	sp,sp,-32
    char byte = c;
    1228:	00a107a3          	sb	a0,15(sp)
    return write(stdout, &byte, 1);
    122c:	00f10593          	addi	a1,sp,15
    1230:	4605                	li	a2,1
    1232:	4505                	li	a0,1
{
    1234:	ec06                	sd	ra,24(sp)
    return write(stdout, &byte, 1);
    1236:	2cf000ef          	jal	ra,1d04 <write>
}
    123a:	60e2                	ld	ra,24(sp)
    123c:	2501                	sext.w	a0,a0
    123e:	6105                	addi	sp,sp,32
    1240:	8082                	ret

0000000000001242 <puts>:
{
    1242:	1141                	addi	sp,sp,-16
    1244:	e406                	sd	ra,8(sp)
    1246:	e022                	sd	s0,0(sp)
    1248:	842a                	mv	s0,a0
    r = -(write(stdout, s, strlen(s)) < 0);
    124a:	59e000ef          	jal	ra,17e8 <strlen>
    124e:	862a                	mv	a2,a0
    1250:	85a2                	mv	a1,s0
    1252:	4505                	li	a0,1
    1254:	2b1000ef          	jal	ra,1d04 <write>
}
    1258:	60a2                	ld	ra,8(sp)
    125a:	6402                	ld	s0,0(sp)
    r = -(write(stdout, s, strlen(s)) < 0);
    125c:	957d                	srai	a0,a0,0x3f
    return r;
    125e:	2501                	sext.w	a0,a0
}
    1260:	0141                	addi	sp,sp,16
    1262:	8082                	ret

0000000000001264 <printf>:
    out(stdout, buf, i);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char *fmt, ...)
{
    1264:	7131                	addi	sp,sp,-192
    1266:	e0da                	sd	s6,64(sp)
    1268:	f53e                	sd	a5,168(sp)
    buf[i++] = '0';
    126a:	7b61                	lui	s6,0xffff8
    va_list ap;
    int cnt = 0, l = 0;
    char *a, *z, *s = (char *)fmt, str;
    int f = stdout;

    va_start(ap, fmt);
    126c:	013c                	addi	a5,sp,136
{
    126e:	f0ca                	sd	s2,96(sp)
    1270:	ecce                	sd	s3,88(sp)
    1272:	e8d2                	sd	s4,80(sp)
    1274:	e4d6                	sd	s5,72(sp)
    1276:	fc5e                	sd	s7,56(sp)
    1278:	fc86                	sd	ra,120(sp)
    127a:	f8a2                	sd	s0,112(sp)
    127c:	f4a6                	sd	s1,104(sp)
    127e:	89aa                	mv	s3,a0
    1280:	e52e                	sd	a1,136(sp)
    1282:	e932                	sd	a2,144(sp)
    1284:	ed36                	sd	a3,152(sp)
    1286:	f13a                	sd	a4,160(sp)
    1288:	f942                	sd	a6,176(sp)
    128a:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    128c:	e03e                	sd	a5,0(sp)
    for (;;)
    {
        if (!*s)
            break;
        for (a = s; *s && *s != '%'; s++)
    128e:	02500913          	li	s2,37
    1292:	07000a93          	li	s5,112
    buf[i++] = '0';
    1296:	830b4b13          	xori	s6,s6,-2000
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    129a:	00001a17          	auipc	s4,0x1
    129e:	d3ea0a13          	addi	s4,s4,-706 # 1fd8 <digits>
        case 'p':
            printptr(va_arg(ap, uint64));
            break;
        case 's':
            if ((a = va_arg(ap, char *)) == 0)
                a = "(null)";
    12a2:	00001b97          	auipc	s7,0x1
    12a6:	d0eb8b93          	addi	s7,s7,-754 # 1fb0 <__clone+0x72>
        if (!*s)
    12aa:	0009c783          	lbu	a5,0(s3)
    12ae:	cfb9                	beqz	a5,130c <printf+0xa8>
        for (a = s; *s && *s != '%'; s++)
    12b0:	23278d63          	beq	a5,s2,14ea <printf+0x286>
    12b4:	864e                	mv	a2,s3
    12b6:	a019                	j	12bc <printf+0x58>
    12b8:	07278563          	beq	a5,s2,1322 <printf+0xbe>
    12bc:	0605                	addi	a2,a2,1
    12be:	00064783          	lbu	a5,0(a2)
    12c2:	fbfd                	bnez	a5,12b8 <printf+0x54>
    12c4:	84b2                	mv	s1,a2
        l = z - a;
    12c6:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    12ca:	8622                	mv	a2,s0
    12cc:	85ce                	mv	a1,s3
    12ce:	4505                	li	a0,1
    12d0:	235000ef          	jal	ra,1d04 <write>
        if (l)
    12d4:	ec3d                	bnez	s0,1352 <printf+0xee>
        if (s[1] == 0)
    12d6:	0014c783          	lbu	a5,1(s1)
    12da:	cb8d                	beqz	a5,130c <printf+0xa8>
        switch (s[1])
    12dc:	09578b63          	beq	a5,s5,1372 <printf+0x10e>
    12e0:	06fafb63          	bleu	a5,s5,1356 <printf+0xf2>
    12e4:	07300713          	li	a4,115
    12e8:	1ce78e63          	beq	a5,a4,14c4 <printf+0x260>
    12ec:	07800713          	li	a4,120
    12f0:	1ae79563          	bne	a5,a4,149a <printf+0x236>
            printint(va_arg(ap, int), 16, 1);
    12f4:	6782                	ld	a5,0(sp)
    12f6:	45c1                	li	a1,16
            // Print unknown % sequence to draw attention.
            putchar('%');
            putchar(s[1]);
            break;
        }
        s += 2;
    12f8:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 16, 1);
    12fc:	4388                	lw	a0,0(a5)
    12fe:	07a1                	addi	a5,a5,8
    1300:	e03e                	sd	a5,0(sp)
    1302:	d5bff0ef          	jal	ra,105c <printint.constprop.0>
        if (!*s)
    1306:	0009c783          	lbu	a5,0(s3)
    130a:	f3dd                	bnez	a5,12b0 <printf+0x4c>
    }
    va_end(ap);
}
    130c:	70e6                	ld	ra,120(sp)
    130e:	7446                	ld	s0,112(sp)
    1310:	74a6                	ld	s1,104(sp)
    1312:	7906                	ld	s2,96(sp)
    1314:	69e6                	ld	s3,88(sp)
    1316:	6a46                	ld	s4,80(sp)
    1318:	6aa6                	ld	s5,72(sp)
    131a:	6b06                	ld	s6,64(sp)
    131c:	7be2                	ld	s7,56(sp)
    131e:	6129                	addi	sp,sp,192
    1320:	8082                	ret
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    1322:	00164783          	lbu	a5,1(a2)
    1326:	84b2                	mv	s1,a2
    1328:	01278763          	beq	a5,s2,1336 <printf+0xd2>
    132c:	bf69                	j	12c6 <printf+0x62>
    132e:	0014c783          	lbu	a5,1(s1)
    1332:	f9279ae3          	bne	a5,s2,12c6 <printf+0x62>
    1336:	0489                	addi	s1,s1,2
    1338:	0004c783          	lbu	a5,0(s1)
    133c:	0605                	addi	a2,a2,1
    133e:	ff2788e3          	beq	a5,s2,132e <printf+0xca>
        l = z - a;
    1342:	4136043b          	subw	s0,a2,s3
    write(f, s, l);
    1346:	8622                	mv	a2,s0
    1348:	85ce                	mv	a1,s3
    134a:	4505                	li	a0,1
    134c:	1b9000ef          	jal	ra,1d04 <write>
        if (l)
    1350:	d059                	beqz	s0,12d6 <printf+0x72>
    1352:	89a6                	mv	s3,s1
    1354:	bf99                	j	12aa <printf+0x46>
    1356:	06400713          	li	a4,100
    135a:	14e79063          	bne	a5,a4,149a <printf+0x236>
            printint(va_arg(ap, int), 10, 1);
    135e:	6782                	ld	a5,0(sp)
    1360:	45a9                	li	a1,10
        s += 2;
    1362:	00248993          	addi	s3,s1,2
            printint(va_arg(ap, int), 10, 1);
    1366:	4388                	lw	a0,0(a5)
    1368:	07a1                	addi	a5,a5,8
    136a:	e03e                	sd	a5,0(sp)
    136c:	cf1ff0ef          	jal	ra,105c <printint.constprop.0>
        s += 2;
    1370:	bf59                	j	1306 <printf+0xa2>
            printptr(va_arg(ap, uint64));
    1372:	6702                	ld	a4,0(sp)
    buf[i++] = '0';
    1374:	01611423          	sh	s6,8(sp)
    write(f, s, l);
    1378:	4649                	li	a2,18
            printptr(va_arg(ap, uint64));
    137a:	631c                	ld	a5,0(a4)
    137c:	0721                	addi	a4,a4,8
    137e:	e03a                	sd	a4,0(sp)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1380:	00479293          	slli	t0,a5,0x4
    1384:	00879f93          	slli	t6,a5,0x8
    1388:	00c79f13          	slli	t5,a5,0xc
    138c:	01079e93          	slli	t4,a5,0x10
    1390:	01479e13          	slli	t3,a5,0x14
    1394:	01879313          	slli	t1,a5,0x18
    1398:	01c79893          	slli	a7,a5,0x1c
    139c:	02479813          	slli	a6,a5,0x24
    13a0:	02879513          	slli	a0,a5,0x28
    13a4:	02c79593          	slli	a1,a5,0x2c
    13a8:	03079693          	slli	a3,a5,0x30
    13ac:	03479713          	slli	a4,a5,0x34
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    13b0:	03c7d413          	srli	s0,a5,0x3c
    13b4:	01c7d39b          	srliw	t2,a5,0x1c
    13b8:	03c2d293          	srli	t0,t0,0x3c
    13bc:	03cfdf93          	srli	t6,t6,0x3c
    13c0:	03cf5f13          	srli	t5,t5,0x3c
    13c4:	03cede93          	srli	t4,t4,0x3c
    13c8:	03ce5e13          	srli	t3,t3,0x3c
    13cc:	03c35313          	srli	t1,t1,0x3c
    13d0:	03c8d893          	srli	a7,a7,0x3c
    13d4:	03c85813          	srli	a6,a6,0x3c
    13d8:	9171                	srli	a0,a0,0x3c
    13da:	91f1                	srli	a1,a1,0x3c
    13dc:	92f1                	srli	a3,a3,0x3c
    13de:	9371                	srli	a4,a4,0x3c
    13e0:	96d2                	add	a3,a3,s4
    13e2:	9752                	add	a4,a4,s4
    13e4:	9452                	add	s0,s0,s4
    13e6:	92d2                	add	t0,t0,s4
    13e8:	9fd2                	add	t6,t6,s4
    13ea:	9f52                	add	t5,t5,s4
    13ec:	9ed2                	add	t4,t4,s4
    13ee:	9e52                	add	t3,t3,s4
    13f0:	9352                	add	t1,t1,s4
    13f2:	98d2                	add	a7,a7,s4
    13f4:	93d2                	add	t2,t2,s4
    13f6:	9852                	add	a6,a6,s4
    13f8:	9552                	add	a0,a0,s4
    13fa:	95d2                	add	a1,a1,s4
    13fc:	0006c983          	lbu	s3,0(a3)
    1400:	0002c283          	lbu	t0,0(t0)
    1404:	00074683          	lbu	a3,0(a4)
    1408:	000fcf83          	lbu	t6,0(t6)
    140c:	000f4f03          	lbu	t5,0(t5)
    1410:	000ece83          	lbu	t4,0(t4)
    1414:	000e4e03          	lbu	t3,0(t3)
    1418:	00034303          	lbu	t1,0(t1)
    141c:	0008c883          	lbu	a7,0(a7)
    1420:	0003c383          	lbu	t2,0(t2)
    1424:	00084803          	lbu	a6,0(a6)
    1428:	00054503          	lbu	a0,0(a0)
    142c:	0005c583          	lbu	a1,0(a1)
    1430:	00044403          	lbu	s0,0(s0)
    for (j = 0; j < (sizeof(uint64) * 2); j++, x <<= 4)
    1434:	03879713          	slli	a4,a5,0x38
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1438:	9371                	srli	a4,a4,0x3c
    143a:	8bbd                	andi	a5,a5,15
    143c:	9752                	add	a4,a4,s4
    143e:	97d2                	add	a5,a5,s4
    1440:	005105a3          	sb	t0,11(sp)
    1444:	01f10623          	sb	t6,12(sp)
    1448:	01e106a3          	sb	t5,13(sp)
    144c:	01d10723          	sb	t4,14(sp)
    1450:	01c107a3          	sb	t3,15(sp)
    1454:	00610823          	sb	t1,16(sp)
    1458:	011108a3          	sb	a7,17(sp)
    145c:	00710923          	sb	t2,18(sp)
    1460:	010109a3          	sb	a6,19(sp)
    1464:	00a10a23          	sb	a0,20(sp)
    1468:	00b10aa3          	sb	a1,21(sp)
    146c:	01310b23          	sb	s3,22(sp)
    1470:	00d10ba3          	sb	a3,23(sp)
    1474:	00810523          	sb	s0,10(sp)
    1478:	00074703          	lbu	a4,0(a4)
    147c:	0007c783          	lbu	a5,0(a5)
    write(f, s, l);
    1480:	002c                	addi	a1,sp,8
    1482:	4505                	li	a0,1
        buf[i++] = digits[x >> (sizeof(uint64) * 8 - 4)];
    1484:	00e10c23          	sb	a4,24(sp)
    1488:	00f10ca3          	sb	a5,25(sp)
    buf[i] = 0;
    148c:	00010d23          	sb	zero,26(sp)
        s += 2;
    1490:	00248993          	addi	s3,s1,2
    write(f, s, l);
    1494:	071000ef          	jal	ra,1d04 <write>
        s += 2;
    1498:	b5bd                	j	1306 <printf+0xa2>
    char byte = c;
    149a:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    149e:	4605                	li	a2,1
    14a0:	002c                	addi	a1,sp,8
    14a2:	4505                	li	a0,1
    char byte = c;
    14a4:	00f10423          	sb	a5,8(sp)
    return write(stdout, &byte, 1);
    14a8:	05d000ef          	jal	ra,1d04 <write>
    char byte = c;
    14ac:	0014c783          	lbu	a5,1(s1)
    return write(stdout, &byte, 1);
    14b0:	4605                	li	a2,1
    14b2:	002c                	addi	a1,sp,8
    14b4:	4505                	li	a0,1
    char byte = c;
    14b6:	00f10423          	sb	a5,8(sp)
        s += 2;
    14ba:	00248993          	addi	s3,s1,2
    return write(stdout, &byte, 1);
    14be:	047000ef          	jal	ra,1d04 <write>
        s += 2;
    14c2:	b591                	j	1306 <printf+0xa2>
            if ((a = va_arg(ap, char *)) == 0)
    14c4:	6782                	ld	a5,0(sp)
    14c6:	6380                	ld	s0,0(a5)
    14c8:	07a1                	addi	a5,a5,8
    14ca:	e03e                	sd	a5,0(sp)
    14cc:	cc05                	beqz	s0,1504 <printf+0x2a0>
            l = strnlen(a, 200);
    14ce:	0c800593          	li	a1,200
    14d2:	8522                	mv	a0,s0
    14d4:	446000ef          	jal	ra,191a <strnlen>
    write(f, s, l);
    14d8:	0005061b          	sext.w	a2,a0
    14dc:	85a2                	mv	a1,s0
    14de:	4505                	li	a0,1
    14e0:	025000ef          	jal	ra,1d04 <write>
        s += 2;
    14e4:	00248993          	addi	s3,s1,2
    14e8:	bd39                	j	1306 <printf+0xa2>
        for (z = s; s[0] == '%' && s[1] == '%'; z++, s += 2)
    14ea:	0019c783          	lbu	a5,1(s3)
    14ee:	84ce                	mv	s1,s3
    14f0:	864e                	mv	a2,s3
    14f2:	e52782e3          	beq	a5,s2,1336 <printf+0xd2>
    write(f, s, l);
    14f6:	4601                	li	a2,0
    14f8:	85ce                	mv	a1,s3
    14fa:	4505                	li	a0,1
    14fc:	009000ef          	jal	ra,1d04 <write>
    1500:	84ce                	mv	s1,s3
    1502:	bbd1                	j	12d6 <printf+0x72>
                a = "(null)";
    1504:	845e                	mv	s0,s7
    1506:	b7e1                	j	14ce <printf+0x26a>

0000000000001508 <isspace>:
#define HIGHS (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x)&HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    1508:	02000793          	li	a5,32
    150c:	00f50663          	beq	a0,a5,1518 <isspace+0x10>
    1510:	355d                	addiw	a0,a0,-9
    1512:	00553513          	sltiu	a0,a0,5
    1516:	8082                	ret
    1518:	4505                	li	a0,1
}
    151a:	8082                	ret

000000000000151c <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    151c:	fd05051b          	addiw	a0,a0,-48
}
    1520:	00a53513          	sltiu	a0,a0,10
    1524:	8082                	ret

0000000000001526 <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    1526:	02000613          	li	a2,32
    152a:	4591                	li	a1,4

int atoi(const char *s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    152c:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    1530:	0007079b          	sext.w	a5,a4
    1534:	ff77869b          	addiw	a3,a5,-9
    1538:	04c70b63          	beq	a4,a2,158e <atoi+0x68>
    153c:	04d5f963          	bleu	a3,a1,158e <atoi+0x68>
        s++;
    switch (*s)
    1540:	02b00693          	li	a3,43
    1544:	04d70a63          	beq	a4,a3,1598 <atoi+0x72>
    1548:	02d00693          	li	a3,45
    154c:	06d70463          	beq	a4,a3,15b4 <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    1550:	fd07859b          	addiw	a1,a5,-48
    1554:	4625                	li	a2,9
    1556:	873e                	mv	a4,a5
    1558:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    155a:	4e01                	li	t3,0
    while (isdigit(*s))
    155c:	04b66a63          	bltu	a2,a1,15b0 <atoi+0x8a>
    int n = 0, neg = 0;
    1560:	4501                	li	a0,0
    while (isdigit(*s))
    1562:	4825                	li	a6,9
        n = 10 * n - (*s++ - '0');
    1564:	0685                	addi	a3,a3,1
    while (isdigit(*s))
    1566:	0006c603          	lbu	a2,0(a3)
        n = 10 * n - (*s++ - '0');
    156a:	0025179b          	slliw	a5,a0,0x2
    156e:	9d3d                	addw	a0,a0,a5
    1570:	fd07031b          	addiw	t1,a4,-48
    1574:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    1578:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    157c:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    1580:	0006071b          	sext.w	a4,a2
    1584:	feb870e3          	bleu	a1,a6,1564 <atoi+0x3e>
    return neg ? n : -n;
    1588:	000e0563          	beqz	t3,1592 <atoi+0x6c>
}
    158c:	8082                	ret
        s++;
    158e:	0505                	addi	a0,a0,1
    1590:	bf71                	j	152c <atoi+0x6>
    1592:	4113053b          	subw	a0,t1,a7
    1596:	8082                	ret
    while (isdigit(*s))
    1598:	00154783          	lbu	a5,1(a0)
    159c:	4625                	li	a2,9
        s++;
    159e:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15a2:	fd07859b          	addiw	a1,a5,-48
    15a6:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    15aa:	4e01                	li	t3,0
    while (isdigit(*s))
    15ac:	fab67ae3          	bleu	a1,a2,1560 <atoi+0x3a>
    15b0:	4501                	li	a0,0
}
    15b2:	8082                	ret
    while (isdigit(*s))
    15b4:	00154783          	lbu	a5,1(a0)
    15b8:	4625                	li	a2,9
        s++;
    15ba:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    15be:	fd07859b          	addiw	a1,a5,-48
    15c2:	0007871b          	sext.w	a4,a5
    15c6:	feb665e3          	bltu	a2,a1,15b0 <atoi+0x8a>
        neg = 1;
    15ca:	4e05                	li	t3,1
    15cc:	bf51                	j	1560 <atoi+0x3a>

00000000000015ce <memset>:

void *memset(void *dest, int c, size_t n)
{
    char *p = dest;
    for (int i = 0; i < n; ++i, *(p++) = c)
    15ce:	16060d63          	beqz	a2,1748 <memset+0x17a>
    15d2:	40a007b3          	neg	a5,a0
    15d6:	8b9d                	andi	a5,a5,7
    15d8:	00778713          	addi	a4,a5,7
    15dc:	482d                	li	a6,11
    15de:	0ff5f593          	andi	a1,a1,255
    15e2:	fff60693          	addi	a3,a2,-1
    15e6:	17076263          	bltu	a4,a6,174a <memset+0x17c>
    15ea:	16e6ea63          	bltu	a3,a4,175e <memset+0x190>
    15ee:	16078563          	beqz	a5,1758 <memset+0x18a>
    15f2:	00b50023          	sb	a1,0(a0)
    15f6:	4705                	li	a4,1
    15f8:	00150e93          	addi	t4,a0,1
    15fc:	14e78c63          	beq	a5,a4,1754 <memset+0x186>
    1600:	00b500a3          	sb	a1,1(a0)
    1604:	4709                	li	a4,2
    1606:	00250e93          	addi	t4,a0,2
    160a:	14e78d63          	beq	a5,a4,1764 <memset+0x196>
    160e:	00b50123          	sb	a1,2(a0)
    1612:	470d                	li	a4,3
    1614:	00350e93          	addi	t4,a0,3
    1618:	12e78b63          	beq	a5,a4,174e <memset+0x180>
    161c:	00b501a3          	sb	a1,3(a0)
    1620:	4711                	li	a4,4
    1622:	00450e93          	addi	t4,a0,4
    1626:	14e78163          	beq	a5,a4,1768 <memset+0x19a>
    162a:	00b50223          	sb	a1,4(a0)
    162e:	4715                	li	a4,5
    1630:	00550e93          	addi	t4,a0,5
    1634:	12e78c63          	beq	a5,a4,176c <memset+0x19e>
    1638:	00b502a3          	sb	a1,5(a0)
    163c:	471d                	li	a4,7
    163e:	00650e93          	addi	t4,a0,6
    1642:	12e79763          	bne	a5,a4,1770 <memset+0x1a2>
    1646:	00750e93          	addi	t4,a0,7
    164a:	00b50323          	sb	a1,6(a0)
    164e:	4f1d                	li	t5,7
    1650:	00859713          	slli	a4,a1,0x8
    1654:	8f4d                	or	a4,a4,a1
    1656:	01059e13          	slli	t3,a1,0x10
    165a:	01c76e33          	or	t3,a4,t3
    165e:	01859313          	slli	t1,a1,0x18
    1662:	006e6333          	or	t1,t3,t1
    1666:	02059893          	slli	a7,a1,0x20
    166a:	011368b3          	or	a7,t1,a7
    166e:	02859813          	slli	a6,a1,0x28
    1672:	40f60333          	sub	t1,a2,a5
    1676:	0108e833          	or	a6,a7,a6
    167a:	03059693          	slli	a3,a1,0x30
    167e:	00d866b3          	or	a3,a6,a3
    1682:	03859713          	slli	a4,a1,0x38
    1686:	97aa                	add	a5,a5,a0
    1688:	ff837813          	andi	a6,t1,-8
    168c:	8f55                	or	a4,a4,a3
    168e:	00f806b3          	add	a3,a6,a5
    1692:	e398                	sd	a4,0(a5)
    1694:	07a1                	addi	a5,a5,8
    1696:	fed79ee3          	bne	a5,a3,1692 <memset+0xc4>
    169a:	ff837693          	andi	a3,t1,-8
    169e:	00de87b3          	add	a5,t4,a3
    16a2:	01e6873b          	addw	a4,a3,t5
    16a6:	0ad30663          	beq	t1,a3,1752 <memset+0x184>
    16aa:	00b78023          	sb	a1,0(a5)
    16ae:	0017069b          	addiw	a3,a4,1
    16b2:	08c6fb63          	bleu	a2,a3,1748 <memset+0x17a>
    16b6:	00b780a3          	sb	a1,1(a5)
    16ba:	0027069b          	addiw	a3,a4,2
    16be:	08c6f563          	bleu	a2,a3,1748 <memset+0x17a>
    16c2:	00b78123          	sb	a1,2(a5)
    16c6:	0037069b          	addiw	a3,a4,3
    16ca:	06c6ff63          	bleu	a2,a3,1748 <memset+0x17a>
    16ce:	00b781a3          	sb	a1,3(a5)
    16d2:	0047069b          	addiw	a3,a4,4
    16d6:	06c6f963          	bleu	a2,a3,1748 <memset+0x17a>
    16da:	00b78223          	sb	a1,4(a5)
    16de:	0057069b          	addiw	a3,a4,5
    16e2:	06c6f363          	bleu	a2,a3,1748 <memset+0x17a>
    16e6:	00b782a3          	sb	a1,5(a5)
    16ea:	0067069b          	addiw	a3,a4,6
    16ee:	04c6fd63          	bleu	a2,a3,1748 <memset+0x17a>
    16f2:	00b78323          	sb	a1,6(a5)
    16f6:	0077069b          	addiw	a3,a4,7
    16fa:	04c6f763          	bleu	a2,a3,1748 <memset+0x17a>
    16fe:	00b783a3          	sb	a1,7(a5)
    1702:	0087069b          	addiw	a3,a4,8
    1706:	04c6f163          	bleu	a2,a3,1748 <memset+0x17a>
    170a:	00b78423          	sb	a1,8(a5)
    170e:	0097069b          	addiw	a3,a4,9
    1712:	02c6fb63          	bleu	a2,a3,1748 <memset+0x17a>
    1716:	00b784a3          	sb	a1,9(a5)
    171a:	00a7069b          	addiw	a3,a4,10
    171e:	02c6f563          	bleu	a2,a3,1748 <memset+0x17a>
    1722:	00b78523          	sb	a1,10(a5)
    1726:	00b7069b          	addiw	a3,a4,11
    172a:	00c6ff63          	bleu	a2,a3,1748 <memset+0x17a>
    172e:	00b785a3          	sb	a1,11(a5)
    1732:	00c7069b          	addiw	a3,a4,12
    1736:	00c6f963          	bleu	a2,a3,1748 <memset+0x17a>
    173a:	00b78623          	sb	a1,12(a5)
    173e:	2735                	addiw	a4,a4,13
    1740:	00c77463          	bleu	a2,a4,1748 <memset+0x17a>
    1744:	00b786a3          	sb	a1,13(a5)
        ;
    return dest;
}
    1748:	8082                	ret
    174a:	472d                	li	a4,11
    174c:	bd79                	j	15ea <memset+0x1c>
    for (int i = 0; i < n; ++i, *(p++) = c)
    174e:	4f0d                	li	t5,3
    1750:	b701                	j	1650 <memset+0x82>
    1752:	8082                	ret
    1754:	4f05                	li	t5,1
    1756:	bded                	j	1650 <memset+0x82>
    1758:	8eaa                	mv	t4,a0
    175a:	4f01                	li	t5,0
    175c:	bdd5                	j	1650 <memset+0x82>
    175e:	87aa                	mv	a5,a0
    1760:	4701                	li	a4,0
    1762:	b7a1                	j	16aa <memset+0xdc>
    1764:	4f09                	li	t5,2
    1766:	b5ed                	j	1650 <memset+0x82>
    1768:	4f11                	li	t5,4
    176a:	b5dd                	j	1650 <memset+0x82>
    176c:	4f15                	li	t5,5
    176e:	b5cd                	j	1650 <memset+0x82>
    1770:	4f19                	li	t5,6
    1772:	bdf9                	j	1650 <memset+0x82>

0000000000001774 <strcmp>:

int strcmp(const char *l, const char *r)
{
    for (; *l == *r && *l; l++, r++)
    1774:	00054703          	lbu	a4,0(a0)
    1778:	0005c783          	lbu	a5,0(a1)
    177c:	00e79b63          	bne	a5,a4,1792 <strcmp+0x1e>
    1780:	cf89                	beqz	a5,179a <strcmp+0x26>
    1782:	0505                	addi	a0,a0,1
    1784:	0585                	addi	a1,a1,1
    1786:	0005c783          	lbu	a5,0(a1)
    178a:	00054703          	lbu	a4,0(a0)
    178e:	fef709e3          	beq	a4,a5,1780 <strcmp+0xc>
        ;
    return *(unsigned char *)l - *(unsigned char *)r;
    1792:	0007051b          	sext.w	a0,a4
}
    1796:	9d1d                	subw	a0,a0,a5
    1798:	8082                	ret
    for (; *l == *r && *l; l++, r++)
    179a:	4501                	li	a0,0
}
    179c:	9d1d                	subw	a0,a0,a5
    179e:	8082                	ret

00000000000017a0 <strncmp>:

int strncmp(const char *_l, const char *_r, size_t n)
{
    const unsigned char *l = (void *)_l, *r = (void *)_r;
    if (!n--)
    17a0:	c231                	beqz	a2,17e4 <strncmp+0x44>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17a2:	00054783          	lbu	a5,0(a0)
    17a6:	0005c683          	lbu	a3,0(a1)
    17aa:	c795                	beqz	a5,17d6 <strncmp+0x36>
    17ac:	ca85                	beqz	a3,17dc <strncmp+0x3c>
    if (!n--)
    17ae:	167d                	addi	a2,a2,-1
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    17b0:	c615                	beqz	a2,17dc <strncmp+0x3c>
    17b2:	00150713          	addi	a4,a0,1
    17b6:	9532                	add	a0,a0,a2
    17b8:	00d78963          	beq	a5,a3,17ca <strncmp+0x2a>
    17bc:	a005                	j	17dc <strncmp+0x3c>
    17be:	ce99                	beqz	a3,17dc <strncmp+0x3c>
    17c0:	00e50e63          	beq	a0,a4,17dc <strncmp+0x3c>
    17c4:	0705                	addi	a4,a4,1
    17c6:	00d79b63          	bne	a5,a3,17dc <strncmp+0x3c>
    17ca:	00074783          	lbu	a5,0(a4)
    17ce:	0585                	addi	a1,a1,1
    17d0:	0005c683          	lbu	a3,0(a1)
    17d4:	f7ed                	bnez	a5,17be <strncmp+0x1e>
    17d6:	4501                	li	a0,0
        ;
    return *l - *r;
    17d8:	9d15                	subw	a0,a0,a3
    17da:	8082                	ret
    17dc:	0007851b          	sext.w	a0,a5
    17e0:	9d15                	subw	a0,a0,a3
    17e2:	8082                	ret
        return 0;
    17e4:	4501                	li	a0,0
}
    17e6:	8082                	ret

00000000000017e8 <strlen>:
size_t strlen(const char *s)
{
    const char *a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word *w;
    for (; (uintptr_t)s % SS; s++)
    17e8:	00757793          	andi	a5,a0,7
    17ec:	cfa1                	beqz	a5,1844 <strlen+0x5c>
        if (!*s)
    17ee:	00054783          	lbu	a5,0(a0)
    17f2:	cbb9                	beqz	a5,1848 <strlen+0x60>
    17f4:	87aa                	mv	a5,a0
    17f6:	a021                	j	17fe <strlen+0x16>
    17f8:	0007c703          	lbu	a4,0(a5)
    17fc:	c329                	beqz	a4,183e <strlen+0x56>
    for (; (uintptr_t)s % SS; s++)
    17fe:	0785                	addi	a5,a5,1
    1800:	0077f713          	andi	a4,a5,7
    1804:	fb75                	bnez	a4,17f8 <strlen+0x10>
            return s - a;
    for (w = (const void *)s; !HASZERO(*w); w++)
    1806:	00000717          	auipc	a4,0x0
    180a:	7ba70713          	addi	a4,a4,1978 # 1fc0 <__func__.1006+0x8>
    180e:	630c                	ld	a1,0(a4)
    1810:	00000717          	auipc	a4,0x0
    1814:	7b870713          	addi	a4,a4,1976 # 1fc8 <__func__.1006+0x10>
    1818:	6394                	ld	a3,0(a5)
    181a:	6310                	ld	a2,0(a4)
    181c:	a019                	j	1822 <strlen+0x3a>
    181e:	07a1                	addi	a5,a5,8
    1820:	6394                	ld	a3,0(a5)
    1822:	00b68733          	add	a4,a3,a1
    1826:	fff6c693          	not	a3,a3
    182a:	8f75                	and	a4,a4,a3
    182c:	8f71                	and	a4,a4,a2
    182e:	db65                	beqz	a4,181e <strlen+0x36>
        ;
    s = (const void *)w;
    for (; *s; s++)
    1830:	0007c703          	lbu	a4,0(a5)
    1834:	c709                	beqz	a4,183e <strlen+0x56>
    1836:	0785                	addi	a5,a5,1
    1838:	0007c703          	lbu	a4,0(a5)
    183c:	ff6d                	bnez	a4,1836 <strlen+0x4e>
        ;
    return s - a;
    183e:	40a78533          	sub	a0,a5,a0
}
    1842:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    1844:	87aa                	mv	a5,a0
    1846:	b7c1                	j	1806 <strlen+0x1e>
        if (!*s)
    1848:	4501                	li	a0,0
            return s - a;
    184a:	8082                	ret

000000000000184c <memchr>:

void *memchr(const void *src, int c, size_t n)
{
    const unsigned char *s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    184c:	00757793          	andi	a5,a0,7
    1850:	0ff5f593          	andi	a1,a1,255
    1854:	cb99                	beqz	a5,186a <memchr+0x1e>
    1856:	c655                	beqz	a2,1902 <memchr+0xb6>
    1858:	00054783          	lbu	a5,0(a0)
    185c:	0ab78663          	beq	a5,a1,1908 <memchr+0xbc>
    1860:	0505                	addi	a0,a0,1
    1862:	00757793          	andi	a5,a0,7
    1866:	167d                	addi	a2,a2,-1
    1868:	f7fd                	bnez	a5,1856 <memchr+0xa>
            ;
        s = (const void *)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void *)s : 0;
    186a:	4701                	li	a4,0
    if (n && *s != c)
    186c:	ca49                	beqz	a2,18fe <memchr+0xb2>
    186e:	00054783          	lbu	a5,0(a0)
    1872:	08b78b63          	beq	a5,a1,1908 <memchr+0xbc>
        size_t k = ONES * c;
    1876:	00000797          	auipc	a5,0x0
    187a:	75a78793          	addi	a5,a5,1882 # 1fd0 <__func__.1006+0x18>
    187e:	6394                	ld	a3,0(a5)
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1880:	479d                	li	a5,7
        size_t k = ONES * c;
    1882:	02d588b3          	mul	a7,a1,a3
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1886:	08c7f863          	bleu	a2,a5,1916 <memchr+0xca>
    188a:	611c                	ld	a5,0(a0)
    188c:	00000317          	auipc	t1,0x0
    1890:	73c30313          	addi	t1,t1,1852 # 1fc8 <__func__.1006+0x10>
    1894:	00033803          	ld	a6,0(t1)
    1898:	00f8c7b3          	xor	a5,a7,a5
    189c:	fff7c713          	not	a4,a5
    18a0:	8f95                	sub	a5,a5,a3
    18a2:	8ff9                	and	a5,a5,a4
    18a4:	0107f7b3          	and	a5,a5,a6
    18a8:	e7bd                	bnez	a5,1916 <memchr+0xca>
    18aa:	4e1d                	li	t3,7
    18ac:	00000e97          	auipc	t4,0x0
    18b0:	714e8e93          	addi	t4,t4,1812 # 1fc0 <__func__.1006+0x8>
    18b4:	a005                	j	18d4 <memchr+0x88>
    18b6:	6514                	ld	a3,8(a0)
    18b8:	000eb783          	ld	a5,0(t4)
    18bc:	00033803          	ld	a6,0(t1)
    18c0:	00d8c6b3          	xor	a3,a7,a3
    18c4:	97b6                	add	a5,a5,a3
    18c6:	fff6c693          	not	a3,a3
    18ca:	8ff5                	and	a5,a5,a3
    18cc:	0107f7b3          	and	a5,a5,a6
    18d0:	e3a1                	bnez	a5,1910 <memchr+0xc4>
    18d2:	853a                	mv	a0,a4
    18d4:	1661                	addi	a2,a2,-8
    18d6:	00850713          	addi	a4,a0,8
    18da:	fcce6ee3          	bltu	t3,a2,18b6 <memchr+0x6a>
    for (; n && *s != c; s++, n--)
    18de:	c215                	beqz	a2,1902 <memchr+0xb6>
    18e0:	00074783          	lbu	a5,0(a4)
    18e4:	00f58d63          	beq	a1,a5,18fe <memchr+0xb2>
    18e8:	00170793          	addi	a5,a4,1
    18ec:	963a                	add	a2,a2,a4
    18ee:	873e                	mv	a4,a5
    18f0:	00f60963          	beq	a2,a5,1902 <memchr+0xb6>
    18f4:	0007c683          	lbu	a3,0(a5)
    18f8:	0785                	addi	a5,a5,1
    18fa:	feb69ae3          	bne	a3,a1,18ee <memchr+0xa2>
}
    18fe:	853a                	mv	a0,a4
    1900:	8082                	ret
    return n ? (void *)s : 0;
    1902:	4701                	li	a4,0
}
    1904:	853a                	mv	a0,a4
    1906:	8082                	ret
    1908:	872a                	mv	a4,a0
    190a:	00074783          	lbu	a5,0(a4)
    190e:	bfd9                	j	18e4 <memchr+0x98>
    1910:	00854783          	lbu	a5,8(a0)
    1914:	bfc1                	j	18e4 <memchr+0x98>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1916:	872a                	mv	a4,a0
    1918:	bfc1                	j	18e8 <memchr+0x9c>

000000000000191a <strnlen>:
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    191a:	00757793          	andi	a5,a0,7
    191e:	cfc5                	beqz	a5,19d6 <strnlen+0xbc>
    1920:	c1c5                	beqz	a1,19c0 <strnlen+0xa6>
    1922:	00054783          	lbu	a5,0(a0)
    1926:	cfd9                	beqz	a5,19c4 <strnlen+0xaa>
    1928:	87ae                	mv	a5,a1
    192a:	86aa                	mv	a3,a0
    192c:	a029                	j	1936 <strnlen+0x1c>
    192e:	cbc9                	beqz	a5,19c0 <strnlen+0xa6>
    1930:	0006c703          	lbu	a4,0(a3)
    1934:	cb51                	beqz	a4,19c8 <strnlen+0xae>
    1936:	0685                	addi	a3,a3,1
    1938:	0076f713          	andi	a4,a3,7
    193c:	17fd                	addi	a5,a5,-1
    193e:	fb65                	bnez	a4,192e <strnlen+0x14>
    if (n && *s != c)
    1940:	c3c1                	beqz	a5,19c0 <strnlen+0xa6>
    1942:	0006c703          	lbu	a4,0(a3)
    1946:	c349                	beqz	a4,19c8 <strnlen+0xae>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    1948:	471d                	li	a4,7
    194a:	08f77a63          	bleu	a5,a4,19de <strnlen+0xc4>
    194e:	00000e17          	auipc	t3,0x0
    1952:	672e0e13          	addi	t3,t3,1650 # 1fc0 <__func__.1006+0x8>
    1956:	6290                	ld	a2,0(a3)
    1958:	000e3703          	ld	a4,0(t3)
    195c:	00000e97          	auipc	t4,0x0
    1960:	66ce8e93          	addi	t4,t4,1644 # 1fc8 <__func__.1006+0x10>
    1964:	000eb803          	ld	a6,0(t4)
    1968:	9732                	add	a4,a4,a2
    196a:	fff64613          	not	a2,a2
    196e:	8f71                	and	a4,a4,a2
    1970:	01077733          	and	a4,a4,a6
    1974:	e72d                	bnez	a4,19de <strnlen+0xc4>
    1976:	4f1d                	li	t5,7
    1978:	a839                	j	1996 <strnlen+0x7c>
    197a:	6698                	ld	a4,8(a3)
    197c:	000e3303          	ld	t1,0(t3)
    1980:	000eb803          	ld	a6,0(t4)
    1984:	fff74893          	not	a7,a4
    1988:	971a                	add	a4,a4,t1
    198a:	01177733          	and	a4,a4,a7
    198e:	01077733          	and	a4,a4,a6
    1992:	ef1d                	bnez	a4,19d0 <strnlen+0xb6>
    1994:	86b2                	mv	a3,a2
    1996:	17e1                	addi	a5,a5,-8
    1998:	00868613          	addi	a2,a3,8
    199c:	fcff6fe3          	bltu	t5,a5,197a <strnlen+0x60>
    for (; n && *s != c; s++, n--)
    19a0:	c385                	beqz	a5,19c0 <strnlen+0xa6>
    19a2:	00064703          	lbu	a4,0(a2)
    19a6:	cb19                	beqz	a4,19bc <strnlen+0xa2>
    19a8:	00160713          	addi	a4,a2,1
    19ac:	97b2                	add	a5,a5,a2
    19ae:	863a                	mv	a2,a4
    19b0:	00e78863          	beq	a5,a4,19c0 <strnlen+0xa6>
    19b4:	0705                	addi	a4,a4,1
    19b6:	fff74683          	lbu	a3,-1(a4)
    19ba:	faf5                	bnez	a3,19ae <strnlen+0x94>

size_t strnlen(const char *s, size_t n)
{
    const char *p = memchr(s, 0, n);
    return p ? p - s : n;
    19bc:	40a605b3          	sub	a1,a2,a0
}
    19c0:	852e                	mv	a0,a1
    19c2:	8082                	ret
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19c4:	87ae                	mv	a5,a1
    19c6:	86aa                	mv	a3,a0
    if (n && *s != c)
    19c8:	8636                	mv	a2,a3
    19ca:	00064703          	lbu	a4,0(a2)
    19ce:	bfe1                	j	19a6 <strnlen+0x8c>
    19d0:	0086c703          	lbu	a4,8(a3)
    19d4:	bfc9                	j	19a6 <strnlen+0x8c>
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    19d6:	87ae                	mv	a5,a1
    19d8:	86aa                	mv	a3,a0
    if (n && *s != c)
    19da:	f7a5                	bnez	a5,1942 <strnlen+0x28>
    19dc:	b7d5                	j	19c0 <strnlen+0xa6>
        for (w = (const void *)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    19de:	8636                	mv	a2,a3
    19e0:	b7e1                	j	19a8 <strnlen+0x8e>

00000000000019e2 <strcpy>:
char *strcpy(char *restrict d, const char *s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS)
    19e2:	00b547b3          	xor	a5,a0,a1
    19e6:	8b9d                	andi	a5,a5,7
    19e8:	efa9                	bnez	a5,1a42 <strcpy+0x60>
    {
        for (; (uintptr_t)s % SS; s++, d++)
    19ea:	0075f793          	andi	a5,a1,7
    19ee:	c38d                	beqz	a5,1a10 <strcpy+0x2e>
            if (!(*d = *s))
    19f0:	0005c783          	lbu	a5,0(a1)
    19f4:	00f50023          	sb	a5,0(a0)
    19f8:	e799                	bnez	a5,1a06 <strcpy+0x24>
    19fa:	a095                	j	1a5e <strcpy+0x7c>
    19fc:	0005c783          	lbu	a5,0(a1)
    1a00:	00f50023          	sb	a5,0(a0)
    1a04:	cbb9                	beqz	a5,1a5a <strcpy+0x78>
        for (; (uintptr_t)s % SS; s++, d++)
    1a06:	0585                	addi	a1,a1,1
    1a08:	0075f793          	andi	a5,a1,7
    1a0c:	0505                	addi	a0,a0,1
    1a0e:	f7fd                	bnez	a5,19fc <strcpy+0x1a>
                return d;
        wd = (void *)d;
        ws = (const void *)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    1a10:	00000797          	auipc	a5,0x0
    1a14:	5b078793          	addi	a5,a5,1456 # 1fc0 <__func__.1006+0x8>
    1a18:	0007b803          	ld	a6,0(a5)
    1a1c:	00000797          	auipc	a5,0x0
    1a20:	5ac78793          	addi	a5,a5,1452 # 1fc8 <__func__.1006+0x10>
    1a24:	6198                	ld	a4,0(a1)
    1a26:	6390                	ld	a2,0(a5)
    1a28:	a031                	j	1a34 <strcpy+0x52>
    1a2a:	0521                	addi	a0,a0,8
    1a2c:	05a1                	addi	a1,a1,8
    1a2e:	fee53c23          	sd	a4,-8(a0)
    1a32:	6198                	ld	a4,0(a1)
    1a34:	010707b3          	add	a5,a4,a6
    1a38:	fff74693          	not	a3,a4
    1a3c:	8ff5                	and	a5,a5,a3
    1a3e:	8ff1                	and	a5,a5,a2
    1a40:	d7ed                	beqz	a5,1a2a <strcpy+0x48>
            ;
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; (*d = *s); s++, d++)
    1a42:	0005c783          	lbu	a5,0(a1)
    1a46:	00f50023          	sb	a5,0(a0)
    1a4a:	cb89                	beqz	a5,1a5c <strcpy+0x7a>
    1a4c:	0585                	addi	a1,a1,1
    1a4e:	0005c783          	lbu	a5,0(a1)
    1a52:	0505                	addi	a0,a0,1
    1a54:	00f50023          	sb	a5,0(a0)
    1a58:	fbf5                	bnez	a5,1a4c <strcpy+0x6a>
        ;
    return d;
}
    1a5a:	8082                	ret
    1a5c:	8082                	ret
    1a5e:	8082                	ret

0000000000001a60 <strncpy>:
char *strncpy(char *restrict d, const char *s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word *wd;
    const word *ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN))
    1a60:	00b547b3          	xor	a5,a0,a1
    1a64:	8b9d                	andi	a5,a5,7
    1a66:	ebc1                	bnez	a5,1af6 <strncpy+0x96>
    {
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    1a68:	0075f793          	andi	a5,a1,7
    1a6c:	cf91                	beqz	a5,1a88 <strncpy+0x28>
    1a6e:	20060e63          	beqz	a2,1c8a <strncpy+0x22a>
    1a72:	0005c783          	lbu	a5,0(a1)
    1a76:	00f50023          	sb	a5,0(a0)
    1a7a:	c3d5                	beqz	a5,1b1e <strncpy+0xbe>
    1a7c:	0585                	addi	a1,a1,1
    1a7e:	0075f793          	andi	a5,a1,7
    1a82:	167d                	addi	a2,a2,-1
    1a84:	0505                	addi	a0,a0,1
    1a86:	f7e5                	bnez	a5,1a6e <strncpy+0xe>
            ;
        if (!n || !*s)
    1a88:	20060163          	beqz	a2,1c8a <strncpy+0x22a>
    1a8c:	0005c683          	lbu	a3,0(a1)
    1a90:	c6d9                	beqz	a3,1b1e <strncpy+0xbe>
            goto tail;
        wd = (void *)d;
        ws = (const void *)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1a92:	479d                	li	a5,7
    1a94:	22c7f563          	bleu	a2,a5,1cbe <strncpy+0x25e>
    1a98:	00000317          	auipc	t1,0x0
    1a9c:	52830313          	addi	t1,t1,1320 # 1fc0 <__func__.1006+0x8>
    1aa0:	6198                	ld	a4,0(a1)
    1aa2:	00033783          	ld	a5,0(t1)
    1aa6:	00000e17          	auipc	t3,0x0
    1aaa:	522e0e13          	addi	t3,t3,1314 # 1fc8 <__func__.1006+0x10>
    1aae:	000e3803          	ld	a6,0(t3)
    1ab2:	97ba                	add	a5,a5,a4
    1ab4:	fff74893          	not	a7,a4
    1ab8:	0117f7b3          	and	a5,a5,a7
    1abc:	0107f7b3          	and	a5,a5,a6
    1ac0:	1e079f63          	bnez	a5,1cbe <strncpy+0x25e>
    1ac4:	4e9d                	li	t4,7
    1ac6:	a005                	j	1ae6 <strncpy+0x86>
    1ac8:	6598                	ld	a4,8(a1)
    1aca:	00033783          	ld	a5,0(t1)
    1ace:	000e3803          	ld	a6,0(t3)
    1ad2:	fff74893          	not	a7,a4
    1ad6:	97ba                	add	a5,a5,a4
    1ad8:	0117f7b3          	and	a5,a5,a7
    1adc:	0107f7b3          	and	a5,a5,a6
    1ae0:	1a079f63          	bnez	a5,1c9e <strncpy+0x23e>
    1ae4:	85b6                	mv	a1,a3
            *wd = *ws;
    1ae6:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ae8:	1661                	addi	a2,a2,-8
    1aea:	00858693          	addi	a3,a1,8
    1aee:	0521                	addi	a0,a0,8
    1af0:	fcceece3          	bltu	t4,a2,1ac8 <strncpy+0x68>
    1af4:	85b6                	mv	a1,a3
        d = (void *)wd;
        s = (const void *)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    1af6:	18060a63          	beqz	a2,1c8a <strncpy+0x22a>
    1afa:	0005c783          	lbu	a5,0(a1)
    1afe:	872a                	mv	a4,a0
    1b00:	00f50023          	sb	a5,0(a0)
    1b04:	e799                	bnez	a5,1b12 <strncpy+0xb2>
    1b06:	a829                	j	1b20 <strncpy+0xc0>
    1b08:	0005c783          	lbu	a5,0(a1)
    1b0c:	00f70023          	sb	a5,0(a4)
    1b10:	cb81                	beqz	a5,1b20 <strncpy+0xc0>
    1b12:	167d                	addi	a2,a2,-1
    1b14:	0585                	addi	a1,a1,1
    1b16:	0705                	addi	a4,a4,1
    1b18:	fa65                	bnez	a2,1b08 <strncpy+0xa8>
        ;
tail:
    memset(d, 0, n);
    return d;
}
    1b1a:	853a                	mv	a0,a4
    1b1c:	8082                	ret
    for (; n && (*d = *s); n--, s++, d++)
    1b1e:	872a                	mv	a4,a0
    1b20:	4805                	li	a6,1
    1b22:	14061c63          	bnez	a2,1c7a <strncpy+0x21a>
    1b26:	40e007b3          	neg	a5,a4
    1b2a:	8b9d                	andi	a5,a5,7
    1b2c:	4581                	li	a1,0
    1b2e:	12061e63          	bnez	a2,1c6a <strncpy+0x20a>
    1b32:	00778693          	addi	a3,a5,7
    1b36:	452d                	li	a0,11
    1b38:	12a6e763          	bltu	a3,a0,1c66 <strncpy+0x206>
    1b3c:	16d5e663          	bltu	a1,a3,1ca8 <strncpy+0x248>
    1b40:	14078c63          	beqz	a5,1c98 <strncpy+0x238>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1b44:	00070023          	sb	zero,0(a4)
    1b48:	4585                	li	a1,1
    1b4a:	00170693          	addi	a3,a4,1
    1b4e:	14b78363          	beq	a5,a1,1c94 <strncpy+0x234>
    1b52:	000700a3          	sb	zero,1(a4)
    1b56:	4589                	li	a1,2
    1b58:	00270693          	addi	a3,a4,2
    1b5c:	14b78963          	beq	a5,a1,1cae <strncpy+0x24e>
    1b60:	00070123          	sb	zero,2(a4)
    1b64:	458d                	li	a1,3
    1b66:	00370693          	addi	a3,a4,3
    1b6a:	12b78363          	beq	a5,a1,1c90 <strncpy+0x230>
    1b6e:	000701a3          	sb	zero,3(a4)
    1b72:	4591                	li	a1,4
    1b74:	00470693          	addi	a3,a4,4
    1b78:	12b78d63          	beq	a5,a1,1cb2 <strncpy+0x252>
    1b7c:	00070223          	sb	zero,4(a4)
    1b80:	4595                	li	a1,5
    1b82:	00570693          	addi	a3,a4,5
    1b86:	12b78863          	beq	a5,a1,1cb6 <strncpy+0x256>
    1b8a:	000702a3          	sb	zero,5(a4)
    1b8e:	459d                	li	a1,7
    1b90:	00670693          	addi	a3,a4,6
    1b94:	12b79363          	bne	a5,a1,1cba <strncpy+0x25a>
    1b98:	00770693          	addi	a3,a4,7
    1b9c:	00070323          	sb	zero,6(a4)
    1ba0:	40f80833          	sub	a6,a6,a5
    1ba4:	ff887513          	andi	a0,a6,-8
    1ba8:	97ba                	add	a5,a5,a4
    1baa:	953e                	add	a0,a0,a5
    1bac:	0007b023          	sd	zero,0(a5)
    1bb0:	07a1                	addi	a5,a5,8
    1bb2:	fea79de3          	bne	a5,a0,1bac <strncpy+0x14c>
    1bb6:	ff887513          	andi	a0,a6,-8
    1bba:	9da9                	addw	a1,a1,a0
    1bbc:	00a687b3          	add	a5,a3,a0
    1bc0:	f4a80de3          	beq	a6,a0,1b1a <strncpy+0xba>
    1bc4:	00078023          	sb	zero,0(a5)
    1bc8:	0015869b          	addiw	a3,a1,1
    1bcc:	f4c6f7e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1bd0:	000780a3          	sb	zero,1(a5)
    1bd4:	0025869b          	addiw	a3,a1,2
    1bd8:	f4c6f1e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1bdc:	00078123          	sb	zero,2(a5)
    1be0:	0035869b          	addiw	a3,a1,3
    1be4:	f2c6fbe3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1be8:	000781a3          	sb	zero,3(a5)
    1bec:	0045869b          	addiw	a3,a1,4
    1bf0:	f2c6f5e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1bf4:	00078223          	sb	zero,4(a5)
    1bf8:	0055869b          	addiw	a3,a1,5
    1bfc:	f0c6ffe3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c00:	000782a3          	sb	zero,5(a5)
    1c04:	0065869b          	addiw	a3,a1,6
    1c08:	f0c6f9e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c0c:	00078323          	sb	zero,6(a5)
    1c10:	0075869b          	addiw	a3,a1,7
    1c14:	f0c6f3e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c18:	000783a3          	sb	zero,7(a5)
    1c1c:	0085869b          	addiw	a3,a1,8
    1c20:	eec6fde3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c24:	00078423          	sb	zero,8(a5)
    1c28:	0095869b          	addiw	a3,a1,9
    1c2c:	eec6f7e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c30:	000784a3          	sb	zero,9(a5)
    1c34:	00a5869b          	addiw	a3,a1,10
    1c38:	eec6f1e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c3c:	00078523          	sb	zero,10(a5)
    1c40:	00b5869b          	addiw	a3,a1,11
    1c44:	ecc6fbe3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c48:	000785a3          	sb	zero,11(a5)
    1c4c:	00c5869b          	addiw	a3,a1,12
    1c50:	ecc6f5e3          	bleu	a2,a3,1b1a <strncpy+0xba>
    1c54:	00078623          	sb	zero,12(a5)
    1c58:	25b5                	addiw	a1,a1,13
    1c5a:	ecc5f0e3          	bleu	a2,a1,1b1a <strncpy+0xba>
    1c5e:	000786a3          	sb	zero,13(a5)
}
    1c62:	853a                	mv	a0,a4
    1c64:	8082                	ret
    1c66:	46ad                	li	a3,11
    1c68:	bdd1                	j	1b3c <strncpy+0xdc>
    1c6a:	00778693          	addi	a3,a5,7
    1c6e:	452d                	li	a0,11
    1c70:	fff60593          	addi	a1,a2,-1
    1c74:	eca6f4e3          	bleu	a0,a3,1b3c <strncpy+0xdc>
    1c78:	b7fd                	j	1c66 <strncpy+0x206>
    1c7a:	40e007b3          	neg	a5,a4
    1c7e:	8832                	mv	a6,a2
    1c80:	8b9d                	andi	a5,a5,7
    1c82:	4581                	li	a1,0
    1c84:	ea0607e3          	beqz	a2,1b32 <strncpy+0xd2>
    1c88:	b7cd                	j	1c6a <strncpy+0x20a>
    for (; n && (*d = *s); n--, s++, d++)
    1c8a:	872a                	mv	a4,a0
}
    1c8c:	853a                	mv	a0,a4
    1c8e:	8082                	ret
    for (int i = 0; i < n; ++i, *(p++) = c)
    1c90:	458d                	li	a1,3
    1c92:	b739                	j	1ba0 <strncpy+0x140>
    1c94:	4585                	li	a1,1
    1c96:	b729                	j	1ba0 <strncpy+0x140>
    1c98:	86ba                	mv	a3,a4
    1c9a:	4581                	li	a1,0
    1c9c:	b711                	j	1ba0 <strncpy+0x140>
    1c9e:	0085c783          	lbu	a5,8(a1)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    1ca2:	872a                	mv	a4,a0
    1ca4:	85b6                	mv	a1,a3
    1ca6:	bda9                	j	1b00 <strncpy+0xa0>
    for (int i = 0; i < n; ++i, *(p++) = c)
    1ca8:	87ba                	mv	a5,a4
    1caa:	4581                	li	a1,0
    1cac:	bf21                	j	1bc4 <strncpy+0x164>
    1cae:	4589                	li	a1,2
    1cb0:	bdc5                	j	1ba0 <strncpy+0x140>
    1cb2:	4591                	li	a1,4
    1cb4:	b5f5                	j	1ba0 <strncpy+0x140>
    1cb6:	4595                	li	a1,5
    1cb8:	b5e5                	j	1ba0 <strncpy+0x140>
    1cba:	4599                	li	a1,6
    1cbc:	b5d5                	j	1ba0 <strncpy+0x140>
    for (; n && (*d = *s); n--, s++, d++)
    1cbe:	00d50023          	sb	a3,0(a0)
    1cc2:	872a                	mv	a4,a0
    1cc4:	b5b9                	j	1b12 <strncpy+0xb2>

0000000000001cc6 <open>:
#include <unistd.h>

#include "syscall.h"

int open(const char *path, int flags)
{
    1cc6:	87aa                	mv	a5,a0
    1cc8:	862e                	mv	a2,a1
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
}

static inline long __syscall4(long n, long a, long b, long c, long d)
{
    register long a7 __asm__("a7") = n;
    1cca:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    1cce:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1cd2:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    1cd4:	4689                	li	a3,2
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1cd6:	00000073          	ecall
    return syscall(SYS_openat, AT_FDCWD, path, flags, O_RDWR);
}
    1cda:	2501                	sext.w	a0,a0
    1cdc:	8082                	ret

0000000000001cde <openat>:
    register long a7 __asm__("a7") = n;
    1cde:	03800893          	li	a7,56
    register long a3 __asm__("a3") = d;
    1ce2:	18000693          	li	a3,384
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1ce6:	00000073          	ecall

int openat(int dirfd,const char *path, int flags)
{
    return syscall(SYS_openat, dirfd, path, flags, 0600);
}
    1cea:	2501                	sext.w	a0,a0
    1cec:	8082                	ret

0000000000001cee <close>:
    register long a7 __asm__("a7") = n;
    1cee:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    1cf2:	00000073          	ecall

int close(int fd)
{
    return syscall(SYS_close, fd);
}
    1cf6:	2501                	sext.w	a0,a0
    1cf8:	8082                	ret

0000000000001cfa <read>:
    register long a7 __asm__("a7") = n;
    1cfa:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1cfe:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len)
{
    return syscall(SYS_read, fd, buf, len);
}
    1d02:	8082                	ret

0000000000001d04 <write>:
    register long a7 __asm__("a7") = n;
    1d04:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d08:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len)
{
    return syscall(SYS_write, fd, buf, len);
}
    1d0c:	8082                	ret

0000000000001d0e <getpid>:
    register long a7 __asm__("a7") = n;
    1d0e:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    1d12:	00000073          	ecall

pid_t getpid(void)
{
    return syscall(SYS_getpid);
}
    1d16:	2501                	sext.w	a0,a0
    1d18:	8082                	ret

0000000000001d1a <getppid>:
    register long a7 __asm__("a7") = n;
    1d1a:	0ad00893          	li	a7,173
    __asm_syscall("r"(a7))
    1d1e:	00000073          	ecall

pid_t getppid(void)
{
    return syscall(SYS_getppid);
}
    1d22:	2501                	sext.w	a0,a0
    1d24:	8082                	ret

0000000000001d26 <sched_yield>:
    register long a7 __asm__("a7") = n;
    1d26:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    1d2a:	00000073          	ecall

int sched_yield(void)
{
    return syscall(SYS_sched_yield);
}
    1d2e:	2501                	sext.w	a0,a0
    1d30:	8082                	ret

0000000000001d32 <fork>:
    register long a7 __asm__("a7") = n;
    1d32:	0dc00893          	li	a7,220
    register long a0 __asm__("a0") = a;
    1d36:	4545                	li	a0,17
    register long a1 __asm__("a1") = b;
    1d38:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d3a:	00000073          	ecall

pid_t fork(void)
{
    return syscall(SYS_clone, SIGCHLD, 0);
}
    1d3e:	2501                	sext.w	a0,a0
    1d40:	8082                	ret

0000000000001d42 <clone>:

pid_t clone(int (*fn)(void *arg), void *arg, void *stack, size_t stack_size, unsigned long flags)
{
    1d42:	85b2                	mv	a1,a2
    1d44:	863a                	mv	a2,a4
    if (stack)
    1d46:	c191                	beqz	a1,1d4a <clone+0x8>
	stack += stack_size;
    1d48:	95b6                	add	a1,a1,a3

    return __clone(fn, stack, flags, NULL, NULL, NULL);
    1d4a:	4781                	li	a5,0
    1d4c:	4701                	li	a4,0
    1d4e:	4681                	li	a3,0
    1d50:	2601                	sext.w	a2,a2
    1d52:	1ec0006f          	j	1f3e <__clone>

0000000000001d56 <exit>:
    register long a7 __asm__("a7") = n;
    1d56:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    1d5a:	00000073          	ecall
    //return syscall(SYS_clone, fn, stack, flags, NULL, NULL, NULL);
}
void exit(int code)
{
    syscall(SYS_exit, code);
}
    1d5e:	8082                	ret

0000000000001d60 <waitpid>:
    register long a7 __asm__("a7") = n;
    1d60:	10400893          	li	a7,260
    register long a3 __asm__("a3") = d;
    1d64:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1d66:	00000073          	ecall

int waitpid(int pid, int *code, int options)
{
    return syscall(SYS_wait4, pid, code, options, 0);
}
    1d6a:	2501                	sext.w	a0,a0
    1d6c:	8082                	ret

0000000000001d6e <exec>:
    register long a7 __asm__("a7") = n;
    1d6e:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    1d72:	00000073          	ecall

int exec(char *name)
{
    return syscall(SYS_execve, name);
}
    1d76:	2501                	sext.w	a0,a0
    1d78:	8082                	ret

0000000000001d7a <execve>:
    register long a7 __asm__("a7") = n;
    1d7a:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1d7e:	00000073          	ecall

int execve(const char *name, char *const argv[], char *const argp[])
{
    return syscall(SYS_execve, name, argv, argp);
}
    1d82:	2501                	sext.w	a0,a0
    1d84:	8082                	ret

0000000000001d86 <times>:
    register long a7 __asm__("a7") = n;
    1d86:	09900893          	li	a7,153
    __asm_syscall("r"(a7), "0"(a0))
    1d8a:	00000073          	ecall

int times(void *mytimes)
{
	return syscall(SYS_times, mytimes);
}
    1d8e:	2501                	sext.w	a0,a0
    1d90:	8082                	ret

0000000000001d92 <get_time>:

int64 get_time()
{
    1d92:	1141                	addi	sp,sp,-16
    register long a7 __asm__("a7") = n;
    1d94:	0a900893          	li	a7,169
    register long a0 __asm__("a0") = a;
    1d98:	850a                	mv	a0,sp
    register long a1 __asm__("a1") = b;
    1d9a:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1d9c:	00000073          	ecall
    TimeVal time;
    int err = sys_get_time(&time, 0);
    if (err == 0)
    1da0:	2501                	sext.w	a0,a0
    1da2:	ed09                	bnez	a0,1dbc <get_time+0x2a>
    {
        return ((time.sec & 0xffff) * 1000 + time.usec / 1000);
    1da4:	67a2                	ld	a5,8(sp)
    1da6:	3e800713          	li	a4,1000
    1daa:	00015503          	lhu	a0,0(sp)
    1dae:	02e7d7b3          	divu	a5,a5,a4
    1db2:	02e50533          	mul	a0,a0,a4
    1db6:	953e                	add	a0,a0,a5
    }
    else
    {
        return -1;
    }
}
    1db8:	0141                	addi	sp,sp,16
    1dba:	8082                	ret
        return -1;
    1dbc:	557d                	li	a0,-1
    1dbe:	bfed                	j	1db8 <get_time+0x26>

0000000000001dc0 <sys_get_time>:
    register long a7 __asm__("a7") = n;
    1dc0:	0a900893          	li	a7,169
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1dc4:	00000073          	ecall

int sys_get_time(TimeVal *ts, int tz)
{
    return syscall(SYS_gettimeofday, ts, tz);
}
    1dc8:	2501                	sext.w	a0,a0
    1dca:	8082                	ret

0000000000001dcc <time>:
    register long a7 __asm__("a7") = n;
    1dcc:	42600893          	li	a7,1062
    __asm_syscall("r"(a7), "0"(a0))
    1dd0:	00000073          	ecall

int time(unsigned long *tloc)
{
    return syscall(SYS_time, tloc);
}
    1dd4:	2501                	sext.w	a0,a0
    1dd6:	8082                	ret

0000000000001dd8 <sleep>:

int sleep(unsigned long long time)
{
    1dd8:	1141                	addi	sp,sp,-16
    TimeVal tv = {.sec = time, .usec = 0};
    1dda:	e02a                	sd	a0,0(sp)
    register long a0 __asm__("a0") = a;
    1ddc:	850a                	mv	a0,sp
    1dde:	e402                	sd	zero,8(sp)
    register long a7 __asm__("a7") = n;
    1de0:	06500893          	li	a7,101
    register long a1 __asm__("a1") = b;
    1de4:	85aa                	mv	a1,a0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1de6:	00000073          	ecall
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1dea:	e501                	bnez	a0,1df2 <sleep+0x1a>
    return 0;
    1dec:	4501                	li	a0,0
}
    1dee:	0141                	addi	sp,sp,16
    1df0:	8082                	ret
    if (syscall(SYS_nanosleep, &tv, &tv)) return tv.sec;
    1df2:	4502                	lw	a0,0(sp)
}
    1df4:	0141                	addi	sp,sp,16
    1df6:	8082                	ret

0000000000001df8 <set_priority>:
    register long a7 __asm__("a7") = n;
    1df8:	08c00893          	li	a7,140
    __asm_syscall("r"(a7), "0"(a0))
    1dfc:	00000073          	ecall

int set_priority(int prio)
{
    return syscall(SYS_setpriority, prio);
}
    1e00:	2501                	sext.w	a0,a0
    1e02:	8082                	ret

0000000000001e04 <mmap>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
}

static inline long __syscall6(long n, long a, long b, long c, long d, long e, long f)
{
    register long a7 __asm__("a7") = n;
    1e04:	0de00893          	li	a7,222
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    register long a3 __asm__("a3") = d;
    register long a4 __asm__("a4") = e;
    register long a5 __asm__("a5") = f;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5))
    1e08:	00000073          	ecall

void *mmap(void *start, size_t len, int prot, int flags, int fd, off_t off)
{
    return syscall(SYS_mmap, start, len, prot, flags, fd, off);
}
    1e0c:	8082                	ret

0000000000001e0e <munmap>:
    register long a7 __asm__("a7") = n;
    1e0e:	0d700893          	li	a7,215
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e12:	00000073          	ecall

int munmap(void *start, size_t len)
{
    return syscall(SYS_munmap, start, len);
}
    1e16:	2501                	sext.w	a0,a0
    1e18:	8082                	ret

0000000000001e1a <wait>:

int wait(int *code)
{
    1e1a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e1c:	10400893          	li	a7,260
    register long a0 __asm__("a0") = a;
    1e20:	557d                	li	a0,-1
    register long a2 __asm__("a2") = c;
    1e22:	4601                	li	a2,0
    register long a3 __asm__("a3") = d;
    1e24:	4681                	li	a3,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3))
    1e26:	00000073          	ecall
    return waitpid((int)-1, code, 0);
}
    1e2a:	2501                	sext.w	a0,a0
    1e2c:	8082                	ret

0000000000001e2e <spawn>:
    register long a7 __asm__("a7") = n;
    1e2e:	19000893          	li	a7,400
    __asm_syscall("r"(a7), "0"(a0))
    1e32:	00000073          	ecall

int spawn(char *file)
{
    return syscall(SYS_spawn, file);
}
    1e36:	2501                	sext.w	a0,a0
    1e38:	8082                	ret

0000000000001e3a <mailread>:
    register long a7 __asm__("a7") = n;
    1e3a:	19100893          	li	a7,401
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e3e:	00000073          	ecall

int mailread(void *buf, int len)
{
    return syscall(SYS_mailread, buf, len);
}
    1e42:	2501                	sext.w	a0,a0
    1e44:	8082                	ret

0000000000001e46 <mailwrite>:
    register long a7 __asm__("a7") = n;
    1e46:	19200893          	li	a7,402
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e4a:	00000073          	ecall

int mailwrite(int pid, void *buf, int len)
{
    return syscall(SYS_mailwrite, pid, buf, len);
}
    1e4e:	2501                	sext.w	a0,a0
    1e50:	8082                	ret

0000000000001e52 <fstat>:
    register long a7 __asm__("a7") = n;
    1e52:	05000893          	li	a7,80
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1e56:	00000073          	ecall

int fstat(int fd, struct kstat *st)
{
    return syscall(SYS_fstat, fd, st);
}
    1e5a:	2501                	sext.w	a0,a0
    1e5c:	8082                	ret

0000000000001e5e <sys_linkat>:
    register long a4 __asm__("a4") = e;
    1e5e:	1702                	slli	a4,a4,0x20
    register long a7 __asm__("a7") = n;
    1e60:	02500893          	li	a7,37
    register long a4 __asm__("a4") = e;
    1e64:	9301                	srli	a4,a4,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e66:	00000073          	ecall

int sys_linkat(int olddirfd, char *oldpath, int newdirfd, char *newpath, unsigned int flags)
{
    return syscall(SYS_linkat, olddirfd, oldpath, newdirfd, newpath, flags);
}
    1e6a:	2501                	sext.w	a0,a0
    1e6c:	8082                	ret

0000000000001e6e <sys_unlinkat>:
    register long a2 __asm__("a2") = c;
    1e6e:	1602                	slli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1e70:	02300893          	li	a7,35
    register long a2 __asm__("a2") = c;
    1e74:	9201                	srli	a2,a2,0x20
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1e76:	00000073          	ecall

int sys_unlinkat(int dirfd, char *path, unsigned int flags)
{
    return syscall(SYS_unlinkat, dirfd, path, flags);
}
    1e7a:	2501                	sext.w	a0,a0
    1e7c:	8082                	ret

0000000000001e7e <link>:

int link(char *old_path, char *new_path)
{
    1e7e:	87aa                	mv	a5,a0
    1e80:	86ae                	mv	a3,a1
    register long a7 __asm__("a7") = n;
    1e82:	02500893          	li	a7,37
    register long a0 __asm__("a0") = a;
    1e86:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1e8a:	85be                	mv	a1,a5
    register long a2 __asm__("a2") = c;
    1e8c:	f9c00613          	li	a2,-100
    register long a4 __asm__("a4") = e;
    1e90:	4701                	li	a4,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1e92:	00000073          	ecall
    return sys_linkat(AT_FDCWD, old_path, AT_FDCWD, new_path, 0);
}
    1e96:	2501                	sext.w	a0,a0
    1e98:	8082                	ret

0000000000001e9a <unlink>:

int unlink(char *path)
{
    1e9a:	85aa                	mv	a1,a0
    register long a7 __asm__("a7") = n;
    1e9c:	02300893          	li	a7,35
    register long a0 __asm__("a0") = a;
    1ea0:	f9c00513          	li	a0,-100
    register long a2 __asm__("a2") = c;
    1ea4:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ea6:	00000073          	ecall
    return sys_unlinkat(AT_FDCWD, path, 0);
}
    1eaa:	2501                	sext.w	a0,a0
    1eac:	8082                	ret

0000000000001eae <uname>:
    register long a7 __asm__("a7") = n;
    1eae:	0a000893          	li	a7,160
    __asm_syscall("r"(a7), "0"(a0))
    1eb2:	00000073          	ecall

int uname(void *buf)
{
    return syscall(SYS_uname, buf);
}
    1eb6:	2501                	sext.w	a0,a0
    1eb8:	8082                	ret

0000000000001eba <brk>:
    register long a7 __asm__("a7") = n;
    1eba:	0d600893          	li	a7,214
    __asm_syscall("r"(a7), "0"(a0))
    1ebe:	00000073          	ecall

int brk(void *addr)
{
    return syscall(SYS_brk, addr);
}
    1ec2:	2501                	sext.w	a0,a0
    1ec4:	8082                	ret

0000000000001ec6 <getcwd>:
    register long a7 __asm__("a7") = n;
    1ec6:	48c5                	li	a7,17
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1ec8:	00000073          	ecall

char *getcwd(char *buf, size_t size){
    return syscall(SYS_getcwd, buf, size);
}
    1ecc:	8082                	ret

0000000000001ece <chdir>:
    register long a7 __asm__("a7") = n;
    1ece:	03100893          	li	a7,49
    __asm_syscall("r"(a7), "0"(a0))
    1ed2:	00000073          	ecall

int chdir(const char *path){
    return syscall(SYS_chdir, path);
}
    1ed6:	2501                	sext.w	a0,a0
    1ed8:	8082                	ret

0000000000001eda <mkdir>:

int mkdir(const char *path, mode_t mode){
    1eda:	87aa                	mv	a5,a0
    return syscall(SYS_mkdirat, AT_FDCWD, path, mode);
    1edc:	02059613          	slli	a2,a1,0x20
    1ee0:	9201                	srli	a2,a2,0x20
    register long a7 __asm__("a7") = n;
    1ee2:	02200893          	li	a7,34
    register long a0 __asm__("a0") = a;
    1ee6:	f9c00513          	li	a0,-100
    register long a1 __asm__("a1") = b;
    1eea:	85be                	mv	a1,a5
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1eec:	00000073          	ecall
}
    1ef0:	2501                	sext.w	a0,a0
    1ef2:	8082                	ret

0000000000001ef4 <getdents>:
    register long a7 __asm__("a7") = n;
    1ef4:	03d00893          	li	a7,61
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1ef8:	00000073          	ecall

int getdents(int fd, struct linux_dirent64 *dirp64, unsigned long len){
    //return syscall(SYS_getdents64, fd, dirp64, len);
    return syscall(SYS_getdents64, fd, dirp64, len);
}
    1efc:	2501                	sext.w	a0,a0
    1efe:	8082                	ret

0000000000001f00 <pipe>:
    register long a7 __asm__("a7") = n;
    1f00:	03b00893          	li	a7,59
    register long a1 __asm__("a1") = b;
    1f04:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f06:	00000073          	ecall

int pipe(int fd[2]){
    return syscall(SYS_pipe2, fd, 0);
}
    1f0a:	2501                	sext.w	a0,a0
    1f0c:	8082                	ret

0000000000001f0e <dup>:
    register long a7 __asm__("a7") = n;
    1f0e:	48dd                	li	a7,23
    __asm_syscall("r"(a7), "0"(a0))
    1f10:	00000073          	ecall

int dup(int fd){
    return syscall(SYS_dup, fd);
}
    1f14:	2501                	sext.w	a0,a0
    1f16:	8082                	ret

0000000000001f18 <dup2>:
    register long a7 __asm__("a7") = n;
    1f18:	48e1                	li	a7,24
    register long a2 __asm__("a2") = c;
    1f1a:	4601                	li	a2,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    1f1c:	00000073          	ecall

int dup2(int old, int new){
    return syscall(SYS_dup3, old, new, 0);
}
    1f20:	2501                	sext.w	a0,a0
    1f22:	8082                	ret

0000000000001f24 <mount>:
    register long a7 __asm__("a7") = n;
    1f24:	02800893          	li	a7,40
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4))
    1f28:	00000073          	ecall

int mount(const char *special, const char *dir, const char *fstype, unsigned long flags, const void *data)
{
        return syscall(SYS_mount, special, dir, fstype, flags, data);
}
    1f2c:	2501                	sext.w	a0,a0
    1f2e:	8082                	ret

0000000000001f30 <umount>:
    register long a7 __asm__("a7") = n;
    1f30:	02700893          	li	a7,39
    register long a1 __asm__("a1") = b;
    1f34:	4581                	li	a1,0
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    1f36:	00000073          	ecall

int umount(const char *special)
{
        return syscall(SYS_umount2, special, 0);
}
    1f3a:	2501                	sext.w	a0,a0
    1f3c:	8082                	ret

0000000000001f3e <__clone>:

.global __clone
.type  __clone, %function
__clone:
	# Save func and arg to stack
	addi a1, a1, -16
    1f3e:	15c1                	addi	a1,a1,-16
	sd a0, 0(a1)
    1f40:	e188                	sd	a0,0(a1)
	sd a3, 8(a1)
    1f42:	e594                	sd	a3,8(a1)

	# Call SYS_clone
	mv a0, a2
    1f44:	8532                	mv	a0,a2
	mv a2, a4
    1f46:	863a                	mv	a2,a4
	mv a3, a5
    1f48:	86be                	mv	a3,a5
	mv a4, a6
    1f4a:	8742                	mv	a4,a6
	li a7, 220 # SYS_clone
    1f4c:	0dc00893          	li	a7,220
	ecall
    1f50:	00000073          	ecall

	beqz a0, 1f
    1f54:	c111                	beqz	a0,1f58 <__clone+0x1a>
	# Parent
	ret
    1f56:	8082                	ret

	# Child
1:      ld a1, 0(sp)
    1f58:	6582                	ld	a1,0(sp)
	ld a0, 8(sp)
    1f5a:	6522                	ld	a0,8(sp)
	jalr a1
    1f5c:	9582                	jalr	a1

	# Exit
	li a7, 93 # SYS_exit
    1f5e:	05d00893          	li	a7,93
	ecall
    1f62:	00000073          	ecall
