import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

export enum UserRole {
  ALUMNO = 'alumno',
  PROFESOR = 'profesor',
}

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  email: string;

  @Column()
  password: string;

  @Column()
  nombre: string;

  @Column({
    type: 'simple-enum',
    enum: UserRole,
  })
  rol: UserRole;
}