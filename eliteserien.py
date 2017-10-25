import numpy as np
import matplotlib.pyplot as plt


vif = [12, 17, 8, 12, 2, 1, 3, 7, 10, 7, 2, 7, 8, 11, 6, 7, 10]
lsk = [6, 2, 7, 7, 7, 4, 4, 4, 12, 11, 10, 13, 9, 10, 5, 8, 12]


t = np.arange(2000, 2017, 1);
plot1 = plt.plot(t, vif, label='VIF')
plot2 = plt.plot(t, lsk)

plt.grid(True)
plt.xlabel('sesong')
plt.ylabel('plassering')
plt.title('VIF vs LSK tippeliga-plassering')

#plt.legend([plot1, plot2], ('VIF', 'LSK'), 'best', numpoints=1)
plt.legend(('VIF', 'LSK'))
plt.ylim(1.0, 16.0)
plt.gca().invert_yaxis()
plt.show()

