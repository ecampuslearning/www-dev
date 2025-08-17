export let getChunkedArray = <T>(arr: T[], chunkSize: number): T[][] => {
  let chunkedArr: T[][] = [];

  for (let i = 0; i < arr.length; i += chunkSize) {
    chunkedArr.push(arr.slice(i, i + chunkSize));
  }

  return chunkedArr;
};
