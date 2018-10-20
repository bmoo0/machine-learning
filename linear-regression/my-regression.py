import matplotlib.pyplot as plt
import itertools
import numpy as np


def noisey_line(start = 1, end = 10,samples = 100):
    x = np.linspace(start, end, samples).reshape(1,samples)

    m = np.random.random()
    c = np.random.random()

    y  = np.array([m * i + c + np.random.rand(1,100) for i in x]).reshape(1,100)


    return x, y


def gradient_descent(x, y, cycles = 100, learning_rate = 0.001):
    mest = np.random.random()
    cest = np.random.random()

    x = np.array(x, dtype=np.complex_)
    y = np.array(y, dtype=np.complex_)

    for i in range(cycles):
        dedm = error_m(x,y,mest,cest)
        dedc = error_c(x,y,mest,cest)

        mest = mest - learning_rate * dedm
        cest = cest - learning_rate * dedc

        err = error_gradient(x,y,mest,cest)

    return mest, cest, err




def plot_gradient_descent(x,y,mest,cest,err):

    yest = np.array([mest * i + cest for i in x]).reshape(1,100)

    plt.figure(1)
    plt.plot(x, y, 'o')

    plt.figure(2)
    plt.plot(x, yest, 'o')
    plt.show()


def error_gradient(x,y,m,c):
    e = []
    for xi, yi in zip(x,y):
        ei = (yi - (m * xi + c))
        e.append(abs(ei))
    return np.asarray(e, dtype=np.complex_)

def error_m(x,y,m,c):
    return np.sum(np.multiply(x,(error_gradient(x,y,m,c))))

def error_c(x,y,m,c):
    return np.sum(error_gradient(x,y,m,c))


def main():
    x, y = noisey_line(-5,5,100)

    mest, cest, err = gradient_descent(x,y)
    plot_gradient_descent(x,y,mest,cest,err)



if __name__ == '__main__':
    main()
