import { customAlphabet } from 'nanoid';

let nid = customAlphabet('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', 15);

export let generateId = (prefix: string, length: number = 15) => `${prefix}_${nid(length)}`;
