let cleanupFunctions: (() => Promise<void>)[] = [];

export let registerCleanup = (fn: () => Promise<void>) => cleanupFunctions.push(fn);

export let cleanup = async () => {
  while (cleanupFunctions.length > 0) {
    try {
      await cleanupFunctions.pop()?.();
    } catch (e) {
      console.error('Cleanup failed', e);
      console.log('Continuing with other cleanup functions');
    }
  }
};
