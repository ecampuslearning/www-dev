import { normalizeCase } from './normalize';

export class Cases {
  #normalized: string[];

  constructor(input: string) {
    this.#normalized = normalizeCase(input);
  }

  static toCamelCase(input: string) {
    return new Cases(input).toCamelCase();
  }

  static toPascalCase(input: string) {
    return new Cases(input).toPascalCase();
  }

  static toKebabCase(input: string) {
    return new Cases(input).toKebabCase();
  }

  static toSnakeCase(input: string) {
    return new Cases(input).toSnakeCase();
  }

  toCamelCase() {
    return this.#normalized
      .map((word, i) => (i === 0 ? word : word.charAt(0).toUpperCase() + word.slice(1)))
      .join('');
  }

  toPascalCase() {
    return this.#normalized.map(word => word.charAt(0).toUpperCase() + word.slice(1)).join('');
  }

  toKebabCase() {
    return this.#normalized.join('-');
  }

  toSnakeCase() {
    return this.#normalized.join('_');
  }
}
