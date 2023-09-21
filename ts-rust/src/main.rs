mod shapes;

use crate::shapes::collisions::{Collidable, Contains, PointIter, Points};
use crate::shapes::{area::Area, circle::Circle, rect::Rect};
use anyhow::Result;
use std::fmt::{write, Display, Formatter};
use std::str::FromStr;

enum Shape {
    Circle(Circle),
    Rect(Rect),
}

impl Display for Shape {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        return write!(f, "{}", self);
    }
}

impl FromStr for Shape {
    type Err = anyhow::Error;

    fn from_str(s: &str) -> std::result::Result<Self, Self::Err> {
        let (shape, data) = s.split_once(" ").unwrap_or(("", ""));

        return match shape {
            "rect" => Ok(Shape::Rect(data.parse()?)),
            "circle" => Ok(Shape::Circle(data.parse()?)),
            _ => Err(anyhow::anyhow!("bad shape")),
        };
    }
}

impl Points for &Shape {
    fn points(&self) -> PointIter {
        match self {
            Shape::Circle(c) => c.points(),
            Shape::Rect(r) => r.points(),
        }
    }
}

impl Contains for &Shape {
    fn contains_point(&self, point: (f64, f64)) -> bool {
        match self {
            Shape::Circle(c) => c.contains_point(point),
            Shape::Rect(r) => r.contains_point(point),
        }
    }
}

fn main() -> Result<()> {
    let shapes = std::fs::read_to_string("shapes")?
        .lines()
        .filter_map(|x| x.parse::<Shape>().ok())
        .collect::<Vec<_>>();

    shapes
        .iter()
        .skip(1)
        .zip(shapes.iter().take(shapes.len() - 1))
        .filter(|(a, b)| a.collide(b))
        .for_each(|(a, b)| println!("{} collides with {}", a, b));

    return Ok(());
}
