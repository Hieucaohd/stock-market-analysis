from proj.tasks import add


for i in range(5000):
    add.delay(i, i + 1000)
