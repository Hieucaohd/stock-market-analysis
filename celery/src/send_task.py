from proj.tasks import add


for i in range(5000):
    add.delay(1, 2)
