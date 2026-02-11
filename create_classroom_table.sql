-- Table: public.ClassRoom

-- DROP TABLE IF EXISTS public."ClassRoom";

CREATE TABLE IF NOT EXISTS public."ClassRoom"
(
    "RoomID" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "Address" character varying(255) COLLATE pg_catalog."default" NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT "PK_ClassRoom" PRIMARY KEY ("RoomID"),
    CONSTRAINT check_capacity_positive CHECK (capacity > 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."ClassRoom"

