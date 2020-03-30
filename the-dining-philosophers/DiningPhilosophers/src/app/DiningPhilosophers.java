// package app;
import java.util.concurrent.Semaphore;

// package app;
import java.util.concurrent.Semaphore;

class DiningPhilosophers {
    Semaphore forks[] = { new Semaphore(1), new Semaphore(1), new Semaphore(1), new Semaphore(1), new Semaphore(1)};
    Semaphore pick = new Semaphore(1);

    // 最多允许 4 人用餐
    Semaphore mostEat = new Semaphore(4);

    public DiningPhilosophers() {

    }

    // call the run() method of any runnable to execute its code
    // 96.23% 
    public void wantsToEat(int philosopher,
                           Runnable pickLeftFork,
                           Runnable pickRightFork,
                           Runnable eat,
                           Runnable putLeftFork,
                           Runnable putRightFork) throws InterruptedException {
        // 拿叉时锁住
        pick.acquire();

        pickLeftFork.run();

        pickRightFork.run();

        eat.run();

        putLeftFork.run();
        putRightFork.run();
        
        pick.release();
    }

    // 69.64% 
    public void wantsToEat2(int philosopher,
                           Runnable pickLeftFork,
                           Runnable pickRightFork,
                           Runnable eat,
                           Runnable putLeftFork,
                           Runnable putRightFork) throws InterruptedException {


        Semaphore left = forks[philosopher];
        Semaphore right = forks[(philosopher + 4) % 5];

        // 拿叉时锁住，这样其中一个人可以同时拿起左右叉
        pick.acquire();
        
        // 左手叉
        left.acquire();
        pickLeftFork.run();

        // 右手叉
        right.acquire();
        pickRightFork.run();

        eat.run();
        pick.release();

        // 释放
        // 左手叉
        putLeftFork.run();
        left.release();

        // 右手叉
        putRightFork.run();
        right.release();        
    }

    // 96.23% 
    public void wantsToEat3(int philosopher,
                           Runnable pickLeftFork,
                           Runnable pickRightFork,
                           Runnable eat,
                           Runnable putLeftFork,
                           Runnable putRightFork) throws InterruptedException {
        Semaphore left = forks[philosopher];
        Semaphore right = forks[(philosopher + 4) % 5];
                    
        // 偶数先左后右
        if (philosopher % 2 == 0) {
            // 先左后右
            left.acquire();
            pickLeftFork.run();

            right.acquire();
            pickRightFork.run();

        } else {
            // 奇数先右后左
            right.acquire();
            pickRightFork.run();

            left.acquire();
            pickLeftFork.run();
        }

        eat.run();

        putLeftFork.run();
        left.release();

        putRightFork.run();
        right.release();
    }

    // 同时最多 4 个人拿起叉子，96.23% 
    public void wantsToEat4(int philosopher,
                           Runnable pickLeftFork,
                           Runnable pickRightFork,
                           Runnable eat,
                           Runnable putLeftFork,
                           Runnable putRightFork) throws InterruptedException {
        
        Semaphore left = forks[philosopher];
        Semaphore right = forks[(philosopher + 4) % 5];
        
        mostEat.acquire();

        left.acquire();
        pickLeftFork.run();

        right.acquire();
        pickRightFork.run();

        eat.run();

        putLeftFork.run();
        left.release();

        putRightFork.run();
        right.release();

        mostEat.release();
    }
}