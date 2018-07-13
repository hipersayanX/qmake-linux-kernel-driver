#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>

static int __init mykerneldriver_init(void)
{
    printk(KERN_INFO "Hello world 1.\n");

    return 0;
}

static void __exit mykerneldriver_cleanup(void)
{
    printk(KERN_INFO "Goodbye world 1.\n");
}

module_init(mykerneldriver_init)
module_exit(mykerneldriver_cleanup)

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("Linux kernel driver using Qmake");
