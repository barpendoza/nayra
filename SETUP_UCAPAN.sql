create table ucapan (
  id bigint generated always as identity primary key,
  nama text not null check (char_length(nama) between 1 and 40),
  pesan text not null check (char_length(pesan) between 1 and 200),
  hadir text not null check (hadir in ('Hadir','Belum bisa hadir')),
  created_at timestamptz not null default now()
);
alter table ucapan enable row level security;
create policy "baca ucapan" on ucapan for select to anon using (true);
create policy "kirim ucapan" on ucapan for insert to anon with check (true);
